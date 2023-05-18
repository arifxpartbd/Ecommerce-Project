import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductStepper extends StatefulWidget {
  const ProductStepper({super.key});

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {
  var _currentValue = 0;
  final TextEditingController _steperTextController =
      TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        stepperButton(() {
          if (_currentValue > 1) {
            _currentValue--;
            _steperTextController.text = _currentValue.toString();
            setState(() {});
          }
        }, Icons.remove),
        SizedBox(
          width: 50,
          //height: 50,
          child: TextField(
            controller: _steperTextController,
            enabled: false,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        stepperButton(() {
          if (_currentValue < 20) {
            _currentValue++;
            _steperTextController.text = _currentValue.toString();
            setState(() {});
          }
        }, Icons.add),
      ],
    );
  }

  Widget stepperButton(VoidCallback onTap, IconData iconData) {
    return SizedBox(
      width: 30,
      height: 30,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(5)),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
