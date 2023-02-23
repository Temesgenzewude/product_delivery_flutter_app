import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class CustomAppColumn extends StatelessWidget {
  final String text;
  const CustomAppColumn({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: AppDimensions.font26,
        ),
        SizedBox(height: AppDimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: AppDimensions.iconSize16,
                ),
              ),
            ),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(text: "4.9"),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(text: "1278"),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: AppDimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndText(
              icon: Icons.location_on,
              text: "1.8km",
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}
