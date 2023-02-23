import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
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
      appBar: AppBar(
        title: Text(
          "Product Delivery",
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Recommended Product Detail Page",
          ),
        ),
      ),
    );
  }
}
