import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state");
    return Center(
      child: Container(
        height: AppDimensions.height20 * 5,
        width: AppDimensions.height20 * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radius20 * 5 / 2),
            color: AppColors.mainColor),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    ); 
  }
}
