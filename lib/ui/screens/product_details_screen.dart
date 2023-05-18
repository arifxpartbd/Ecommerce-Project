import 'package:ecommerce/ui/utils/app_colors.dart';
import 'package:ecommerce/ui/utils/styles.dart';
import 'package:ecommerce/ui/widgets/commonElevatedButton.dart';
import 'package:ecommerce/ui/widgets/productDetails/product_image_carousel.dart';
import 'package:flutter/material.dart';
import '../widgets/product_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    const Color(0xFF000000),
    const Color(0xFF0E8F05),
    const Color(0xFFEC1414),
    const Color(0xFFFFCF32),
  ];

  List<String> size = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    "XXXL",
  ];

  Color _selectedColorIndex = const Color(0xFF000000);
  String _selectedSizeIndex = 'L';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImageCarousel(),
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
                                  "Product Name",
                                  style: subTitleTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        Text("4.5")
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
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const ProductStepper()
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
                                  if (_selectedColorIndex != colors) {
                                    _selectedColorIndex = e;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: e,
                                  radius: 15,
                                  child: Visibility(
                                      visible: e == _selectedColorIndex,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            );
                          }).toList()),

                      //size

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
                                  if (_selectedSizeIndex != size) {
                                    _selectedSizeIndex = size;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: greyColor),
                                        color: size == _selectedSizeIndex
                                            ? primaryColor
                                            : null),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: size == _selectedSizeIndex
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    )),
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
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
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
                topLeft: Radius.circular(16.0,),
              topRight: Radius.circular(16.0,),

              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const[
                       Text("Price",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: softGreyColor,
                        fontSize: 16,
                      ),),
                       Text("\$ 100",style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w500
                      ),),

                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: CommonElevatedButton(title: 'Add To Cart', onTap: () {  },

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
