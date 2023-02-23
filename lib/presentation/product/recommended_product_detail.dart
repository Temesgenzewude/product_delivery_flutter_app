import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedProductDetail extends StatelessWidget {
  final int pageId;

  const RecommendedProductDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<RecommendedProductController>().recommendedProductList[pageId];

    // Get.find<PopularProductController>()
    //     .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: AppDimensions.height10 * 8,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_sharp),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppDimensions.height20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimensions.radius20),
                      topRight: Radius.circular(AppDimensions.radius20),
                    )),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: "Silver App Bar",
                    size: AppDimensions.font26,
                  ),
                ),
                padding: EdgeInsets.only(
                    top: AppDimensions.height10 / 2,
                    bottom: AppDimensions.height10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: AppDimensions.height10 * 30,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/img4.jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppDimensions.width20,
                      right: AppDimensions.width20),
                  child: ExpandableTextWidget(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer vitae justo eget magna. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio. In hendrerit gravida rutrum quisque non tellus orci ac auctor. Eu mi bibendum neque egestas congue. Id ornare arcu odio ut sem nulla pharetra. Sit amet aliquam id diam maecenas ultricies. Dolor sit amet consectetur adipiscing. Id diam vel quam elementum pulvinar etiam. Nunc vel risus commodo viverra maecenas accumsan. Purus semper eget duis at. Consectetur lorem donec massa sapien faucibus et molestie ac. Amet consectetur adipiscing elit ut. Id donec ultrices tincidunt arcu non. Iaculis eu non diam phasellus vestibulum. Enim tortor at auctor urna nunc id cursus metus aliquam. Mauris commodo quis imperdiet massa."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: AppDimensions.width10 * 5,
              right: AppDimensions.width10 * 5,
              top: AppDimensions.height10,
              bottom: AppDimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: AppDimensions.iconSize24,
              ),
              BigText(
                text: "\$12.88  " + " X  " + " 0 ",
                color: AppColors.mainBlackColor,
                size: AppDimensions.font26,
              ),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: AppDimensions.iconSize24,
              ),
            ],
          ),
        ),
        Container(
          height: AppDimensions.bottomHeightBar,
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
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              ),
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
      ]),
    );
  }
}
