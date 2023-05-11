import 'package:ecommerce/ui/screens/cart_screen.dart';
import 'package:ecommerce/ui/screens/category_screen.dart';
import 'package:ecommerce/ui/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/wish_list_screen.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        onTap: (value) {
          _selectedIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: softGreyColor,
        currentIndex: _selectedIndex,
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
      ),
    );
  }
}
