import 'package:ecommerce/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductListScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(
                  0.15,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.computer,
                  size: 28,
                  color: primaryColor,
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
