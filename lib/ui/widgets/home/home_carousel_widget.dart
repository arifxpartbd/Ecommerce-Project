import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/data/models/home_slider_model.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {
  final HomeSliderModel homeSliderModel;
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  HomeCarouselWidget({super.key, required this.homeSliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              },
              //autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayInterval: const Duration(
                seconds: 6,
              )),
          items: (homeSliderModel.sliders?.isEmpty?? true)? []: homeSliderModel.sliders!.map((slider) {
            return Builder(
              builder: (BuildContext context) {

                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                         slider.image ?? ""
                        )
                      )
                    ),
                    alignment: Alignment.center,
                    // child: Text(
                    //   'text $i',
                    //   style: const TextStyle(fontSize: 16.0),
                    // ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < (homeSliderModel.sliders?.length ?? 0); i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: currentValue == i ? primaryColor : null,
                            border:
                                Border.all(color: greyColor.withOpacity(.5)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }
}
