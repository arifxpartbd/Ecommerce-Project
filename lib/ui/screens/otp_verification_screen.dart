import 'package:ecommerce/data/service/network_caller.dart';
import 'package:ecommerce/ui/screens/complet_profile_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/state_managment/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/commonElevatedButton.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userAuthController) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
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
                  "Enter OTP Code",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "A 4 Digit OTP Code has been sent",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpETController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedColor: Colors.green,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white10,
                    activeColor: primaryColor,
                    inactiveColor: primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                userAuthController.otpVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButton(
                        title: 'Next',
                        onTap: () async {
                          final bool response =
                              await userAuthController.otpVerification(
                                  widget.email, _otpETController.text);
                          if (response) {
                            // final userresponse = await NetworkCaller.getRequest(url: "/ReadProfile");
                            // if(userresponse.returnData["data"] == []){
                            //   Get.to(CompleteProfileScreen());
                            // }else{
                            //   Get.to(HomeScreen());
                            // }
                            //Get.to(CompleteProfileScreen());
                            Get.to(HomeScreen());


                          } else {
                            Get.showSnackbar(
                              const GetSnackBar(
                                title: "Otp verification Failed",
                                message:
                                    "Check your once again before again it",
                              ),
                            );
                          }
                        },
                      ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 13,
                        color: softGreyColor,
                      ),
                      text: "This code will be expire in: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          text: '120 s',
                        ),
                      ]),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: greyColor.withOpacity(0.8)),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
