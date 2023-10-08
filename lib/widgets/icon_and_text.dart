import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const IconAndText({

    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: AppDimensions.height15+AppDimensions.height10/3,
        ),
        SizedBox(
          width: AppDimensions.width10/4,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
