// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class ProfileWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  const ProfileWidget({
    Key? key,
    required this.appIcon,
    required this.bigText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: AppDimensions.width20,
          top: AppDimensions.width10,
          bottom: AppDimensions.width10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(children: [
        appIcon,
        SizedBox(
          width: AppDimensions.width20,
        ),
        bigText
      ]),
    );
  }
}
