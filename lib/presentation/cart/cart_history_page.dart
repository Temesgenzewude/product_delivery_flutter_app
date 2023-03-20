import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeList();

    return Scaffold(
      body: Column(children: [
        Container(
          height: AppDimensions.height25 * 4,
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: AppDimensions.height45),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BigText(
              text: "Your Cart History",
              color: Colors.white,
            ),
            AppIcon(
              icon: Icons.shopping_cart_outlined,
              iconColor: AppColors.mainColor,
              backgroundColor: AppColors.yellowColor,
            )
          ]),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(
              top: AppDimensions.height20,
              left: AppDimensions.width20,
              right: AppDimensions.width20),
          child: ListView(children: [
            
          ]),
        ))
      ]),
    );
  }
}
