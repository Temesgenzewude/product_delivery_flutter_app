import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product/recommended_product_controller.dart';
import 'package:food_delivery/models/product/products_model.dart';
import 'package:food_delivery/presentation/product/popular_product_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/custome_app_column.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({super.key});

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = AppDimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: AppDimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //popular text
        SizedBox(
          height: AppDimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: AppDimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: AppDimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: AppDimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Product Pairing"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppDimensions.height20,
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ?
              //List of product and images
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedProductDetail(
                            index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppDimensions.width20,
                          right: AppDimensions.width20,
                          bottom: AppDimensions.height10,
                        ),
                        child: Row(
                          children: [
                            //show product image

                            Container(
                              height: AppDimensions.listViewImgWidthSize120,
                              width: AppDimensions.listViewImgWidthSize120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radius20,
                                ),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/img3.jpg"),
                                  // image: NetworkImage(AppConstants.BASE_URL +
                                  //     AppConstants.UPLOAD_URL +
                                  //     recommendedProducts
                                  //         .recommendedProductList[index].img!),
                                ),
                              ),
                            ),

                            //show product name text
                            Expanded(
                              child: Container(
                                height:
                                    AppDimensions.listViewTextContHeightSize100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(AppDimensions.radius20),
                                    bottomRight:
                                        Radius.circular(AppDimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: AppDimensions.width10,
                                      right: AppDimensions.width10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: recommendedProducts
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: AppDimensions.height10,
                                      ),
                                      SmallText(
                                          text:
                                              "With Ethiopian Characteristics"),
                                      SizedBox(
                                        height: AppDimensions.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          IconAndText(
                                            icon: Icons.location_on,
                                            text: "1.8km",
                                            iconColor: AppColors.mainColor,
                                          ),
                                          IconAndText(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            iconColor: AppColors.iconColor2,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + ((_currPageValue - index + 1) * (1 - _scaleFactor));
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));

      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - _scaleFactor) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularProductDetail(index, "home"));
            },
            child: Container(
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
                  //  image: NetworkImage(
                  //  AppConstants.BASE_URL + AppConstants.UPLOAD_URL+ popularProduct.img!
                  // ),
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
                  borderRadius: BorderRadius.circular(AppDimensions.radius20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  top: AppDimensions.height10,
                  left: AppDimensions.width15,
                  right: AppDimensions.width15,
                ),
                child: CustomAppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
