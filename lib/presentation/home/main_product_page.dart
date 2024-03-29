import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product/popular_product_controller.dart';
import '../../controllers/recommended_product/recommended_product_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'product_page_body.dart';

class MainProductPage extends StatefulWidget {
  const MainProductPage({super.key});

  @override
  State<MainProductPage> createState() => _MainProductPageState();
}

class _MainProductPageState extends State<MainProductPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _loadResources,
        child: Column(
          children: [
            //header

            Container(
              margin: EdgeInsets.only(
                  top: AppDimensions.height45, bottom: AppDimensions.height15),
              padding: EdgeInsets.only(
                  left: AppDimensions.width20, right: AppDimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Ethiopia", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Addis Ababa", color: Colors.black54),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: AppDimensions.height45,
                      height: AppDimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radius15,
                          ),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: AppDimensions.iconSize24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //body
            const Expanded(
              child: SingleChildScrollView(
                child: ProductPageBody(),
              ),
            ),
          ],
        ));
  }
}
