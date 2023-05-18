import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
          itemBuilder: (context, index) {
            return const ProductCard();
          }),
    );
  }
}
