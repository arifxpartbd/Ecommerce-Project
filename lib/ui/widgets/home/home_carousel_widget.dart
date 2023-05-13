
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({
    super.key,
    required CarouselController carouselController,
    required ValueNotifier<int> currentCarouselIndex,
  }) : _carouselController = carouselController, _currentCarouselIndex = currentCarouselIndex;

  final CarouselController _carouselController;
  final ValueNotifier<int> _currentCarouselIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _){
                _currentCarouselIndex.value = index;
              },
              autoPlayInterval: const Duration(
                seconds: 4,
              )),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6,),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i <5; i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:  Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: currentValue == i? primaryColor : null,
                            border: Border.all(color: greyColor.withOpacity(.5)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                ],
              );
            }
        ),
      ],
    );
  }
}