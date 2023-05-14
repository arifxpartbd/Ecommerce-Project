import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/category_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/wish_list_screen.dart';
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BottomNavBarScreen extends StatelessWidget {
   const BottomNavBarScreen({Key? key}) : super(key: key);

  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(

        builder: (controller) {
          return _screen[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            elevation: 5,
            onTap: (value) {
              controller.changeIndex(value);

            },
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor,
            currentIndex: controller.selectedIndex,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_travel,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Wishlist",
              ),
            ],
          );
        }
      ),
    );
  }
}
