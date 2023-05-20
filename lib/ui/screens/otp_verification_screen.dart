import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/commonElevatedButton.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                onChanged: (value) {

                },
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              CommonElevatedButton(
                title: 'Next',
                onTap: () {},
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
                    text: "This code will be expair in: ",
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
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(color: greyColor.withOpacity(0.8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
