
import 'package:ecommerce/ui/screens/complet_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: CompleteProfileScreen(),
    );
  }

}