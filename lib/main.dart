import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
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
      initialBinding: GetxBindings(),
      home: const SplashScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: greyColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
      ),
    );
  }
}
class GetxBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(BottomNavigationBarController());

  }
}


//live class 51, watch time : -9:45