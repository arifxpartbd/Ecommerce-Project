
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen.dart';

void main(){
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }

}