import 'package:ecommerce/ui/state_managment/auth_controller.dart';
import 'package:ecommerce/ui/state_managment/cart_controller.dart';
import 'package:ecommerce/ui/state_managment/product_controller.dart';
import 'package:ecommerce/ui/state_managment/wish_list_controller.dart';
import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/utils/styles.dart';
import 'package:ecommerce/ui/widgets/commonElevatedButton.dart';
import 'package:ecommerce/ui/widgets/productDetails/product_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [];

  List<String> size = [];

  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    Get.find<ProductController>().getProductsDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Product Details"),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<ProductController>(builder: (productController) {
        if (productController.getProductsDetailsInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        final productDetails =
            productController.productDetailsModel.data!.first;
        colors = getColors(productDetails.color ?? "");
        size = getSizes(productDetails.size ?? "");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarousel(
                      images: [
                        productDetails.img1 ?? "",
                        productDetails.img2 ?? "",
                        productDetails.img3 ?? "",
                        productDetails.img4 ?? "",
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productDetails.product?.title
                                              .toString() ??
                                          "",
                                      style: subTitleTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                            Text(productDetails.product?.star
                                                    .toString() ??
                                                ""),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Reviews",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                        GetBuilder<WishListController>(
                                          builder: (wishListController) {
                                            if(wishListController.addNewItemInProgress){
                                              return const Center(child: CircularProgressIndicator(),);
                                            }
                                            return InkWell(
                                              onTap: (){
                                                Get.find<WishListController>().addToWishList(productDetails.productId!);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: primaryColor,
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    size: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ProductStepper(onDecrement: (int currentValue) {  }, onIncrement: (int currentValue) {  },)
                            ],
                          ),
                          const Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                              children: colors.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  if (_selectedColor != colors) {
                                    _selectedColor = e;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: e,
                                  radius: 15,
                                  child: Visibility(
                                      visible: e == _selectedColor,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            );
                          }).toList()),

                          //size

                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Size",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                              children: size.map((size) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  if (_selectedSize != size) {
                                    _selectedSize = size;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: greyColor),
                                      color: size == _selectedSize
                                          ? primaryColor
                                          : null),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: size == _selectedSize
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyColor,
                                fontWeight: FontWeight.w600),
                          ),

                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            productDetails.product?.shortDes ?? "",
                            style: const TextStyle(
                                fontSize: 14,
                                color: softGreyColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      16.0,
                    ),
                    topRight: Radius.circular(
                      16.0,
                    ),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: softGreyColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$ ${productDetails.product?.price ?? ""}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                      child: GetBuilder<CartController>(
                        builder: (cartController) {
                          if(cartController.addToCartInProgress){
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          return CommonElevatedButton(
                            title: 'Add To Cart',
                            onTap: () async {
                              final result = await Get.find<AuthController>().checkAuthValidation();
                              if(result){
                                if(_selectedSize != null && _selectedColor != null) {
                                  //api call
                                  Get.find<CartController>().addToCart(
                                      productDetails.productId!,
                                      _selectedSize!,
                                      _getHexCode(_selectedColor!),
                                  ).then((value) {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: "Success",
                                      message: "Your product add to cart",
                                      duration: Duration(seconds: 2),
                                    ));
                                  });
                                }else{
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Select color and size",
                                    message: "Must Select your color and size",
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              }
                            },
                          );
                        }
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  List<String> getSizes(String size) {
    return size.split(",");
  }

  List<Color> getColors(String color) {
    List<Color> hexColors = [];
    List<String> colors = color.split(",");
    for (String c in colors) {
      c = c.replaceAll("#", "0xFF");
      hexColors.add(Color(int.parse(c)));
    }
    return hexColors;
  }

  String _getHexCode(Color color){
    return color.toString().replaceAll("0xff", "#")
        .replaceAll("Color", "").replaceAll("(", "").replaceAll(")", "");
  }
}
