import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/presentation/base/no_data_page.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrderToList = cartItemsPerOrderTimeToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();

      if (index < getCartHistoryList.length) {
        DateTime parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parsedDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(children: [
        Container(
          height: AppDimensions.height25 * 4,
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: AppDimensions.height45),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
        GetBuilder<CartController>(builder: (_cartController) {
          return _cartController.getCartHistoryList().length > 0
              ? Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height20,
                          left: AppDimensions.width20,
                          right: AppDimensions.width20),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(children: [
                          for (int i = 0; i < itemsPerOrderToList.length; i++)
                            Container(
                              height: AppDimensions.height30 * 4,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // BigText(text: "${getCartHistoryList[listCounter].time}"),

                                    /// immediately invoked function between widgets
                                   timeWidget(listCounter),
                                    SizedBox(
                                      height: AppDimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          children: List.generate(
                                              itemsPerOrderToList[i], (index) {
                                            if (listCounter <
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    height:
                                                        AppDimensions.height20 *
                                                            4,
                                                    width:
                                                        AppDimensions.height20 *
                                                            4,
                                                    margin: EdgeInsets.only(
                                                        right: AppDimensions
                                                                .width10 /
                                                            2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppDimensions
                                                                      .radius15 /
                                                                  2),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/images/img3.jpg"),
                                                        // image: NetworkImage(
                                                        //   AppConstants.BASE_URL +
                                                        //       AppConstants.UPLOAD_URL +
                                                        //       getCartHistoryList[listCounter - 1]
                                                        //           .img!,
                                                        // ),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        Container(
                                          height: AppDimensions.height20 * 4,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SmallText(
                                                    text: "Total",
                                                    color:
                                                        AppColors.titleColor),
                                                BigText(
                                                  text:
                                                      "${itemsPerOrderToList[i]} Items",
                                                  color: AppColors.titleColor,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // print(
                                                    //     "order time ${cartOrderTimeToList()[i]}");
                                                    Map<int, CartModel>
                                                        moreOrder = {};

                                                    for (int j = 0;
                                                        j <
                                                            getCartHistoryList
                                                                .length;
                                                        j++) {
                                                      if (getCartHistoryList[j]
                                                              .time ==
                                                          cartOrderTimeToList()[
                                                              i]) {
                                                        moreOrder.putIfAbsent(
                                                            getCartHistoryList[j]
                                                                .id!,
                                                            () => CartModel.fromJson(
                                                                jsonDecode(jsonEncode(
                                                                    getCartHistoryList[
                                                                        j]))));
                                                      }
                                                    }
                                                    Get.find<CartController>()
                                                        .setItems = moreOrder;

                                                    Get.find<CartController>()
                                                        .addToCartList();

                                                    Get.toNamed(RouteHelper
                                                        .getCartPage());
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppDimensions
                                                                .width10,
                                                        vertical: AppDimensions
                                                                .height10 /
                                                            2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppDimensions
                                                                      .radius15 /
                                                                  2),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: AppColors
                                                              .mainColor),
                                                    ),
                                                    child: SmallText(
                                                        text: "View All",
                                                        color: AppColors
                                                            .mainColor),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    )
                                  ]),
                            )
                        ]),
                      )))
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Center(
                      child:
                          NoDataPage(text: "You Didnit Buy Anything So Far")));
        })
      ]),
    );
  }
}
