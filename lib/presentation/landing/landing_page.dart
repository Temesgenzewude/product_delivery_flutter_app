import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product/popular_product_controller.dart';
import '../../controllers/recommended_product/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);

    Timer(const Duration(seconds: 5),
        (() => Get.offNamed(RouteHelper.getInitial())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                child: Image.asset(
                  "assets/images/logo2.jpg",
                  width: AppDimensions.landingImage250,
                  height: AppDimensions.landingImage250,
                ),
              )),
          Center(
              child: BigText(
            text: "Welcome To The Best Product",
          )),
        ],
      ),
    );
  }
}
