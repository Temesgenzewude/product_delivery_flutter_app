import 'package:food_delivery/presentation/account/account_page.dart';
import 'package:food_delivery/presentation/auth/signup_page.dart';
import 'package:food_delivery/presentation/cart/cart_detail_page.dart';
import 'package:food_delivery/presentation/home/home_page.dart';
import 'package:food_delivery/presentation/home/product_page_body.dart';
import 'package:food_delivery/presentation/landing/landing_page.dart';
import 'package:food_delivery/presentation/product/popular_product_detail.dart';
import 'package:food_delivery/presentation/product/recommended_product_detail.dart';
import 'package:food_delivery/presentation/home/main_product_page.dart';
import 'package:get/get.dart';

import '../presentation/cart/cart_history_page.dart';

class RouteHelper {
  static String landingPage = "/landing-page";
  static const String initial = "/";

  static const String popularProductDetail = "/popular-product-detail";

  static const String recommendedProductDetail = "/recommended-product-detail";
  static const String signup = "/signup";
  static const String cartPage = '/cart-page';
  static const String profilePage = '/profile';
  static const String cartHistoryPage = '/cart-history-page';

  static getLandingPage() => '$landingPage';

  static getInitial() => '$initial';

  static String getRecommendedProductDetail(int pageId, String pageName) =>
      '$recommendedProductDetail?pageId=$pageId&pageName=$pageName';

  static String getPopularProductDetail(int pageId, String pageName) =>
      '$popularProductDetail?pageId=$pageId&pageName=$pageName ';

  static String getSignup() => '$signup';
  static String getCartPage() => '$cartPage';
  static String getProfilePage() => '$profilePage';
  static String getCartHistoryPage() => '$cartHistoryPage';

  static List<GetPage> routes = [
    GetPage(name: landingPage, page: (() => LandingScreen())),
    GetPage(
        name: initial, page: () => HomePage(), transition: Transition.fadeIn),
    GetPage(
        name: popularProductDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];
          return PopularProductDetail(
              pageId: int.parse(pageId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedProductDetail,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];

          return RecommendedProductDetail(
            pageId: int.parse(pageId!),
            pageName: pageName!,
          );
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
          return CartDetailPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: profilePage,
        page: () {
          return AccountPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartHistoryPage,
        page: () {
          return CartHistoryPage();
        },
        transition: Transition.fadeIn)
  ];
}
