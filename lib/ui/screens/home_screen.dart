import 'package:ecommerce/ui/screens/email_verification.dart';
import 'package:ecommerce/ui/screens/profile_screen.dart';
import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/state_managment/category_controller.dart';
import 'package:ecommerce/ui/state_managment/home_controller.dart';
import 'package:flutter/material.dart';
import '../state_managment/product_by_remark_controller.dart';
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
  // final CarouselController _carouselController = CarouselController();
  // final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

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
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value) {
                  if (!value) {
                    Get.to(const EmailVerification());
                  } else {
                    Get.to(const ProfileScreen());
                  }
                });
              },
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getSliderInProgress) {
                  return const CircularProgressIndicator();
                }
                return HomeCarouselWidget(
                  homeSliderModel: homeController.homeSliderModel,
                );
              }),
              RemarkTitleWidget(
                remarkName: 'Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.getCategoryInProgress) {
                  return const CircularProgressIndicator();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: categoryController.categoryModelData.categoryData!
                        .map(
                          (e) => CategoryCart(
                            id: e.id ?? 0,
                            categoryName: e.categoryName.toString(),
                            imageUrl: e.categoryImg.toString(),
                          ),
                        )
                        .toList(),
                  ),
                );
              }),


              RemarkTitleWidget(
                remarkName: 'Popular',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    // ProductCard(),
                    // ProductCard(),
                    // ProductCard(),
                  ],
                ),
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productbyRemarkController) {
                if (productbyRemarkController.getPopularProductByRemarkInProgress) {
                  return const CircularProgressIndicator();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: productbyRemarkController.productByRemarkModel.products!
                        .map(
                          (e) => ProductCard(
                            product: e,

                          )
                        )
                        .toList(),
                  ),
                );
              }),



              RemarkTitleWidget(
                remarkName: 'Special',
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productbyRemarkController) {
                    if (productbyRemarkController.getSpecialProductByRemarkInProgress) {
                      return const CircularProgressIndicator();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: productbyRemarkController.specialproductByRemarkModel.products!
                            .map(
                                (e) => ProductCard(
                              product: e,

                            )
                        )
                            .toList(),
                      ),
                    );
                  }),




              RemarkTitleWidget(
                remarkName: 'New',
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductByRemarkController>(
                  builder: (productbyRemarkController) {
                    if (productbyRemarkController.getNewProductByRemarkInProgress) {
                      return const CircularProgressIndicator();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: productbyRemarkController.newproductByRemarkModel.products!
                            .map(
                                (e) => ProductCard(
                              product: e,

                            )
                        )
                            .toList(),
                      ),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
