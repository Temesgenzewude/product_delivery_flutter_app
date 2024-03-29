import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart/cart_controller.dart';
import '../../controllers/popular_product/popular_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/api_end_points.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custome_app_column.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularProductDetail extends StatelessWidget {
  final int pageId;
  final String pageName;
  const PopularProductDetail(
      {super.key, required this.pageId, required this.pageName});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

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
                      // image: AssetImage("assets/images/img7.jpg"),
                      image: NetworkImage(AppConstants.BASE_URL_FOR_IMAGES +
                          AppConstants.UPLOAD_URL +
                          product.img),
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
                    GestureDetector(
                        onTap: () {
                          if (pageName.trim() == "cart") {
                            Get.toNamed(RouteHelper.getCartPage());
                          } else if (pageName.trim() == "home") {
                            Get.toNamed(RouteHelper.getInitial());
                          }
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PopularProductController>(
                        builder: (popularProduct) {
                      return GestureDetector(
                        onTap: () {
                          if (popularProduct.totalItems >= 1) {
                            Get.toNamed(RouteHelper.getCartPage());
                          }
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            popularProduct.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: AppDimensions.height20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor,
                                    ))
                                : Container(),
                            popularProduct.totalItems >= 1
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
                        ),
                      );
                    })
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
                        text: product.name!,
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
                            text: product.description!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            
            
            return Container(
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
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.singColor,
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.width10 / 2,
                        ),
                        BigText(text: popularProduct.inCartItems.toString()),
                        SizedBox(
                          width: AppDimensions.width10 / 2,
                        ),
                        GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(Icons.add, color: AppColors.singColor)),
                      ]),
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
            );
          },
        ));
  }
}
