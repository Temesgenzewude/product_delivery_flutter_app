import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({super.key});

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: AppDimensions.pageView,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: AppDimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: AppDimensions.width10, right: AppDimensions.width10),
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            borderRadius: BorderRadius.circular(AppDimensions.radius30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/img6.jpg",
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppDimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: AppDimensions.width10 * 3,
                right: AppDimensions.width10 * 3,
                bottom: AppDimensions.height30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radius30),
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: AppDimensions.height10,
                left: AppDimensions.width15,
                right: AppDimensions.width15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(height: AppDimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: AppDimensions.iconSize16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.width10,
                      ),
                      SmallText(text: "4.9"),
                      SizedBox(
                        width: AppDimensions.width10,
                      ),
                      SmallText(text: "1278"),
                      SizedBox(
                        width: AppDimensions.width10,
                      ),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
