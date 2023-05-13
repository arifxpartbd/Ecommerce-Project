import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      decoration: InputDecoration(
          hintText: "Search",
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          fillColor: softGreyColor.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: softGreyColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }
}