import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/state_managment/category_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: greyColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(builder: (categoryController) {
          if (categoryController.getCategoryInProgress) {
            return const CircularProgressIndicator();
          }
          return RefreshIndicator(
            onRefresh: () async{
              Get.find<CategoryController>().getCategores();
            },
            child: GridView.builder(
                itemCount:
                    categoryController.categoryModelData.categoryData?.length ??
                        0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final category =
                      categoryController.categoryModelData.categoryData![index];
                  return CategoryCart(
                    id: category.id!,
                    categoryName: category.categoryName.toString(),
                    imageUrl: category.categoryImg.toString(),
                  );
                }),
          );
        }),
      ),
    );
  }
}
