import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/home/product_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainProductPage extends StatefulWidget {
  const MainProductPage({super.key});

  @override
  State<MainProductPage> createState() => _MainProductPageState();
}

class _MainProductPageState extends State<MainProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          
      children: [
        //header

        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: AppDimensions.height45, bottom: AppDimensions.height15),
            padding: EdgeInsets.only(
                left: AppDimensions.width20, right: AppDimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Ethiopia", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Addis Ababa", color: Colors.black54),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: AppDimensions.height45,
                    height: AppDimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: AppDimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius15,
                        ),
                        color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        //body
        Expanded(
          
          child: SingleChildScrollView(
            child: ProductPageBody(),
            
          ),
        ),
      ],
    ));
  }
}
