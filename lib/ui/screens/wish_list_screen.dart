
import 'package:ecommerce/ui/state_managment/bottom_navigation_bar_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
        //leading: BackButton(),
        leading: IconButton(
          onPressed: (){
            Get.find<BottomNavigationBarController>().backToHome();

          },
          icon: Icon(Icons.arrow_back,color: greyColor,),
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      // body: GridView.builder(
      //     itemCount: 10,
      //     gridDelegate:
      //     const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       childAspectRatio: 0.7,
      //     ),
      //     itemBuilder: (context, index) {
      //       return const ProductCard();
      //     }),
    );
  }
}
