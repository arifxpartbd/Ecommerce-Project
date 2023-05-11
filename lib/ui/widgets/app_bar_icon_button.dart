import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 15,
          child: Icon(
            iconData,
            size: 18,
            color: softGreyColor,
          ),
        ),
      ),
    );
  }
}
