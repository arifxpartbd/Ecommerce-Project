import 'package:ecommerce/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce/ui/state_managment/user_auth_controller.dart';
import 'package:ecommerce/ui/utils/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/commonElevatedButton.dart';
import '../widgets/commonTextField.dart';
import 'package:get/get.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 120,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Welcome Back",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Please Enter Your Email Address",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  controller: _emailETController,
                  validator: (String? value) {
                    if(value?.isEmpty ?? true){
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  hintText: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                authController.emailVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButton(
                        title: 'Next',
                        onTap: () async {
                          if(_formKey.currentState!.validate()) {
                            final bool response = await authController
                                .emailVerification(_emailETController.text);

                            if (response) {
                              Get.to(const OTPVerificationScreen());
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Email verification failed. try again"),
                                  ),
                                );
                              }
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
