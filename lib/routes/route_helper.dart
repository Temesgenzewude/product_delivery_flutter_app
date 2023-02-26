import 'package:food_delivery/presentation/account/account_page.dart';
import 'package:food_delivery/presentation/auth/signup_page.dart';
import 'package:food_delivery/presentation/cart/cart_detail_page.dart';
import 'package:food_delivery/presentation/home/product_page_body.dart';
import 'package:food_delivery/presentation/product/popular_product_detail.dart';
import 'package:food_delivery/presentation/product/recommended_product_detail.dart';
import 'package:food_delivery/presentation/home/main_product_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";

  static const String popularProductDetail = "/popular-product-detail";

  static const String recommendedProductDetail = "/recommended-product-detail";
  static const String signup = "/signup";
  static const String cartPage = '/cart-page';
  static const String profilePage = '/profile';

  static getInitial() => '$initial';

  static String getRecommendedProductDetail(int pageId) =>
      '$recommendedProductDetail?pageId=$pageId';
      

  static String getPopularProductDetail(int pageId) =>
      '$popularProductDetail?pageId=$pageId ';

  static String getSignup() => '$signup';
  static String getCartPage() => '$cartPage';
  static String getProfilePage() => '$profilePage';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => MainProductPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: popularProductDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularProductDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedProductDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedProductDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signup,
        page: () {
          return SignUpPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartDetail();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: profilePage,
        page: () {
          return AccountPage();
        },
        transition: Transition.fadeIn),
  ];
}
