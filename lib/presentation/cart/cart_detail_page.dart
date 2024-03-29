import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/cart/cart_controller.dart';
import '../../controllers/location/location_controller.dart';
import '../../controllers/popular_product/popular_product_controller.dart';
import '../../controllers/recommended_product/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/api_end_points.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../base/no_data_page.dart';

class CartDetailPage extends StatelessWidget {
  const CartDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Positioned(
            left: AppDimensions.width20,
            top: AppDimensions.height20 * 3,
            right: AppDimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: AppDimensions.iconSize24,
                ),
                SizedBox(
                  width: AppDimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    size: AppDimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: AppDimensions.iconSize24,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: AppDimensions.height20 * 5,
                    left: AppDimensions.width20,
                    right: AppDimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: AppDimensions.height15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  // color: Colors.red,
                                  height: AppDimensions.height20 * 5,
                                  width: double.maxFinite,
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularProductIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);

                                        if (popularProductIndex >= 0) {
                                          Get.toNamed(RouteHelper
                                              .getPopularProductDetail(
                                                  popularProductIndex, "cart"));
                                        } else {
                                          var recommendedProductIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedProductIndex < 0) {
                                            Get.snackbar(
                                                "This is History Product",
                                                "Product Review is Not Available for History Products!",
                                                backgroundColor:
                                                    Color(0xFF262626),
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(RouteHelper
                                                .getRecommendedProductDetail(
                                                    recommendedProductIndex,
                                                    "cart"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10),
                                        width: AppDimensions.height20 * 5,
                                        height: AppDimensions.height20 * 5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.radius20),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(AppConstants
                                                    .BASE_URL_FOR_IMAGES +
                                                AppConstants.UPLOAD_URL +
                                                _cartList[index].img!),

                                            // image: AssetImage(
                                            //     "assets/images/img4.jpg"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: AppDimensions.height20 * 5,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: _cartList[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: _cartList[index]
                                                      .price!
                                                      .toString(),
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: AppDimensions
                                                          .height10,
                                                      bottom: AppDimensions
                                                          .height10,
                                                      left:
                                                          AppDimensions.width10,
                                                      right: AppDimensions
                                                          .width10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppDimensions
                                                                  .radius20),
                                                      color: Colors.white),
                                                  child: Row(children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.singColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: AppDimensions
                                                              .width10 /
                                                          2,
                                                    ),
                                                    BigText(
                                                        text: _cartList[index]
                                                            .quantity!
                                                            .toString()),
                                                    SizedBox(
                                                      width: AppDimensions
                                                              .width10 /
                                                          2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.singColor,
                                                      ),
                                                    )
                                                  ]),
                                                )
                                              ],
                                            )
                                          ]),
                                    ))
                                  ]),
                                );
                              }));
                        }),
                      ),
                    ),
                  )
                : NoDataPage(text: "Your Cart is Empty");
          })
        ]),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
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
              child: cartController.getItems.length > 0
                  ? Row(
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
                              SizedBox(
                                width: AppDimensions.width10 / 2,
                              ),
                              BigText(
                                  text:
                                      "\$ ${cartController.totalAmount.toString()}"),
                              SizedBox(
                                width: AppDimensions.width10 / 2,
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Get.find<AuthController>().userLoggedIn()) {
                                cartController.addToCartHistoryList();
                                // print("User logged in");

                                if (Get.find<LocationController>()
                                    .addressList
                                    .isEmpty) {
                                  // print("Going to address pag");
                                  Get.toNamed(RouteHelper.getAddressPage());
                                } else {
                                  Get.offNamed(RouteHelper.getInitial());
                                }
                              } else {
                                // print("User not logged in");
                                Get.toNamed(RouteHelper.getSignInPage());
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: AppDimensions.width20,
                                  right: AppDimensions.width20,
                                  top: AppDimensions.height20,
                                  bottom: AppDimensions.height20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20),
                                color: AppColors.mainColor,
                              ),
                              child: BigText(
                                  text: "Checkout", color: Colors.white),
                            ),
                          ),
                        ])
                  : Container(),
            );
          },
        ));
  }
}
