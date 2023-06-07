import 'package:ecommerce/ui/screens/splash_screen.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/state_managment/cart_controller.dart';
import 'package:ecommerce/ui/state_managment/category_controller.dart';
import 'package:ecommerce/ui/state_managment/complet_profile_controller.dart';
import 'package:ecommerce/ui/state_managment/home_controller.dart';
import 'package:ecommerce/ui/state_managment/product_by_remark_controller.dart';
import 'package:ecommerce/ui/state_managment/product_controller.dart';
import 'package:ecommerce/ui/state_managment/user_auth_controller.dart';
import 'package:ecommerce/ui/state_managment/user_profile_controller.dart';
import 'package:ecommerce/ui/state_managment/wish_list_controller.dart';
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
   Get.put(UserAuthController());
   Get.put(AuthController());
   Get.put(UserProfileController());
   Get.put(HomeController());
   Get.put(CategoryController());
   Get.put(ProductByRemarkController());
   Get.put(ProductController());
   Get.put(WishListController());
   Get.put(CartController());
   Get.put(CompletProfileController());
  }
}


//live class 51, watch time : -9:45
//-16.10