import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductStepper extends StatefulWidget{
  const ProductStepper({super.key});

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {

  var _currentValue = 0;
  final TextEditingController _steperTextController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_currentValue > 1) {
              _currentValue--;
              _steperTextController.text = _currentValue.toString();
              setState(() {});
            }
          },
          style:
          ElevatedButton.styleFrom(backgroundColor: primaryColor,fixedSize: const Size(30,30),),
          child: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 50,
          child: TextField(
            controller: _steperTextController,
            enabled: false,
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_currentValue < 20) {
              _currentValue++;
              _steperTextController.text = _currentValue.toString();
              setState(() {});
            }
          },
          style:
          ElevatedButton.styleFrom(backgroundColor: primaryColor, fixedSize: const Size(30, 30),),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
