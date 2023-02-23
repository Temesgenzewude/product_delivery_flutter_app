import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custome_app_column.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularProductDetail extends StatelessWidget {
  final int pageId;
  const PopularProductDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<PopularProductController>().popularProductList[pageId];
    // Get.find<PopularProductController>()
    //     .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: AppDimensions.popularProductImgSize350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/img7.jpg"),
                  ),
                ),
              )),
          Positioned(
              top: AppDimensions.height45,
              left: AppDimensions.width20,
              right: AppDimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: AppDimensions.popularProductImgSize350 -
                  AppDimensions.height45 * 3,
              child: Container(
                padding: EdgeInsets.only(
                    left: AppDimensions.width20,
                    right: AppDimensions.width20,
                    top: AppDimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimensions.radius20),
                      topRight: Radius.circular(AppDimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppColumn(
                      text: "Ethiopians Side",
                    ),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa."),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: AppDimensions.bottomHeightBar - 10,
        padding: EdgeInsets.only(
            top: AppDimensions.height10,
            bottom: AppDimensions.height10,
            left: AppDimensions.width20,
            right: AppDimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.bottomBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radius20 * 2),
            topRight: Radius.circular(AppDimensions.radius20 * 2),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.width20,
                right: AppDimensions.width20,
                top: AppDimensions.height20,
                bottom: AppDimensions.height20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radius20),
            ),
            child: Row(children: [
              Icon(
                Icons.remove,
                color: AppColors.singColor,
              ),
              SizedBox(
                width: AppDimensions.width10 / 2,
              ),
              BigText(text: "0"),
              SizedBox(
                width: AppDimensions.width10 / 2,
              ),
              Icon(Icons.add, color: AppColors.singColor),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.width20,
                right: AppDimensions.width20,
                top: AppDimensions.height20,
                bottom: AppDimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radius20),
              color: AppColors.mainColor,
            ),
            child: BigText(text: "\$10 | Add to cart", color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
