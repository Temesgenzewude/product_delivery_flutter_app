import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

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
        Positioned(
          top: AppDimensions.height20 * 5,
          left: AppDimensions.width20,
          right: AppDimensions.width20,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(top: AppDimensions.height15),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController) {
                return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        // color: Colors.red,
                        height: AppDimensions.height20 * 5,
                        width: double.maxFinite,
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {},
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
                                  image: AssetImage("assets/images/img4.jpg"),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].price!
                                            .toString(),
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: AppDimensions.height10,
                                            bottom: AppDimensions.height10,
                                            left: AppDimensions.width10,
                                            right: AppDimensions.width10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.radius20),
                                            color: Colors.white),
                                        child: Row(children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.remove,
                                              color: AppColors.singColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: AppDimensions.width10 / 2,
                                          ),
                                          BigText(text: "30"),
                                          SizedBox(
                                            width: AppDimensions.width10 / 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.singColor,
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
        ),
      ]),
    );
  }
}
