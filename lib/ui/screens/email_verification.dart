import 'package:ecommerce/ui/screens/otp_verification_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
              controller: TextEditingController(),
              validator: (String? value) {},
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            CommonElevatedButton(
              title: 'Next',
              onTap: () {
                Get.to(const OTPVerificationScreen());
              },
            ),

          ],
        ),
      ),
    );
  }
}
