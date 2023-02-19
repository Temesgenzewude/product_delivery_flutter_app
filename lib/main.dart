import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import "./helper//dependencies.dart" as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<PopularProductController>().getPopularProductList();

    // Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
