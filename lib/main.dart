import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';

import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

import 'dependency/dependencies.dart' as dependency;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the dependencies
  await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    
    
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Product Delivery App',
            initialRoute: RouteHelper.getLandingPage(),
            
            
            getPages: RouteHelper.routes,
          );
        },
      );
    });
  }
}
