import 'package:ecommerce/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      Get.off(const BottomNavBarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 120.0,
              ),
            ),
          ),
          Column(
            children: const [
              CircularProgressIndicator(
                color: primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Version 1.0",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 12,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
