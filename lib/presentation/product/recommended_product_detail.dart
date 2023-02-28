import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
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
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: AppDimensions.height10 * 8,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                // AppIcon(icon: Icons.shopping_cart_sharp),
                GetBuilder<PopularProductController>(builder: (popularProduct) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteHelper.getCartPage());
                                },
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: AppDimensions.height20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              ))
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 3,
                              top: 3,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: AppDimensions.font16 - 4,
                                color: Colors.white,
                              ))
                          : Container()
                    ],
                  );
                })
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
                    text: product.name,
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
                    text: product.description,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.width10 * 5,
                right: AppDimensions.width10 * 5,
                top: AppDimensions.height10,
                bottom: AppDimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    popularProduct.setQuantity(false);
                  },
                  child: AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: AppDimensions.iconSize24,
                  ),
                ),
                BigText(
                  text:
                      "\$ ${product.price!}   X   ${popularProduct.inCartItems} ",
                  color: AppColors.mainBlackColor,
                  size: AppDimensions.font26,
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.setQuantity(true);
                  },
                  child: AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: AppDimensions.iconSize24,
                  ),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: AppDimensions.width20,
                        right: AppDimensions.width20,
                        top: AppDimensions.height20,
                        bottom: AppDimensions.height20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radius20),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: AppDimensions.width20,
                          right: AppDimensions.width20,
                          top: AppDimensions.height20,
                          bottom: AppDimensions.height20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(
                          text: "\$ ${product.price!} | Add to cart",
                          color: Colors.white),
                    ),
                  ),
                ]),
          ),
        ]);
      }),
    );
  }
}
