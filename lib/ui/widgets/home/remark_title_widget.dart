
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/styles.dart';

class RemarkTitleWidget extends StatelessWidget {
  const RemarkTitleWidget({
    super.key,
    required this.remarkName,
    required this.onTapSeeAll,
  });
  final String remarkName;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarkName,
          style: titleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See All",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
