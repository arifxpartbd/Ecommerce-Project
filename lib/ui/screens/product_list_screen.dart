import 'package:ecommerce/ui/state_managment/product_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductListScreen extends StatefulWidget {
  final int categoryId;
  const ProductListScreen({Key? key, required this.categoryId}) : super(key: key);


  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Get.find<ProductController>().getProductByCategory(widget.categoryId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          if(productController.getProductByCategoryInProgress){
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              itemCount: productController.productByCategoryModel.products?.length ?? 0,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
              itemBuilder: (context, index) {
                return  ProductCard(
                  product: productController.productByCategoryModel.products![index],
                );
              });
        }
      ),
    );
  }
}
