import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class commonTextField extends StatelessWidget {
  const commonTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.textInputType,
  });

  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: softGreyColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
