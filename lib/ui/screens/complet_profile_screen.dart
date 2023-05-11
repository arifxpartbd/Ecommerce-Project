import 'package:ecommerce/ui/utils/styles.dart';
import 'package:ecommerce/ui/widgets/commonElevatedButton.dart';
import 'package:ecommerce/ui/widgets/commonTextField.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 120.0,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Complete Profile",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Get Started with us with your details",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  controller: TextEditingController(),
                  validator: (value) {},
                  hintText: "First Name",
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  controller: TextEditingController(),
                  validator: (value) {},
                  hintText: "Last Name",
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  textInputType: TextInputType.number,
                  controller: TextEditingController(),
                  validator: (value) {},
                  hintText: "Mobile No",
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  controller: TextEditingController(),
                  validator: (value) {},
                  hintText: "City",
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextField(
                  maxLine: 5,
                  controller: TextEditingController(),
                  validator: (value) {},
                  hintText: "Shipping Address",
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonElevatedButton(
                  title: "Complete",
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
