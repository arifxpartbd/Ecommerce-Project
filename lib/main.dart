import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1
        ),
      ),
    );
  }

}


//live class 46, watch time : 1:09:23