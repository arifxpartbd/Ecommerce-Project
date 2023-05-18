import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/home/app_bar_icon_button.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remark_title_widget.dart';
import '../widgets/home/search_text_field.dart';
import '../widgets/product_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/images/logo_nav.png"),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.notification_important,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 16,
              ),
              HomeCarouselWidget(

              ),
              RemarkTitleWidget(
                remarkName: 'Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCart(
                      categoryName: 'Computer',
                    ),
                    CategoryCart(
                      categoryName: 'Electronics',
                    ),
                    CategoryCart(
                      categoryName: 'Clothes',
                    ),
                    CategoryCart(
                      categoryName: 'Computer',
                    ),
                    CategoryCart(
                      categoryName: 'Computer',
                    ),
                    CategoryCart(
                      categoryName: 'Computer',
                    ),
                  ],
                ),
              ),
              RemarkTitleWidget(
                remarkName: 'Popular',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCard(),
                    ProductCard(),
                    ProductCard(),
                  ],
                ),
              ),
              RemarkTitleWidget(
                remarkName: 'Special',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCard(),
                    ProductCard(),
                    ProductCard(),
                  ],
                ),
              ),
              RemarkTitleWidget(
                remarkName: 'New',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCard(),
                    ProductCard(),
                    ProductCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
