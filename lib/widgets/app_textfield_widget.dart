import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  bool isObscure;
   AppTextField(
      {super.key,
      required this.textEditingController,
      required this.icon,
      required this.hintText,
      this.isObscure=false
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppDimensions.height20, right: AppDimensions.height20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radius15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(1, 1),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        obscureText: isObscure? true: false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.radius15,
            ),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.radius15,
            ),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.radius15,
            ),
          ),
        ),
      ),
    );
  }
}
