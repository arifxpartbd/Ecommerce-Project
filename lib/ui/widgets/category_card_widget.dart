import 'package:ecommerce/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    super.key,
    required this.categoryName,
    required this.imageUrl, required this.id,
  });
  final String categoryName, imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductListScreen(
          categoryId: id,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(
                  0.1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imageUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: primaryColor,
                letterSpacing: 0.6,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
