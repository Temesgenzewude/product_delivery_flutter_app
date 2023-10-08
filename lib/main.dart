import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/cart/cart_controller.dart';
import 'controllers/popular_product/popular_product_controller.dart';
import 'controllers/recommended_product/recommended_product_controller.dart';
import 'dependency/dependencies.dart' as dependency;
import 'routes/route_helper.dart';
import 'utils/colors.dart';

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

            theme: ThemeData(primaryColor: AppColors.mainColor, fontFamily: "Lato"),
            
          );
        },
      );
    });
  }
}



