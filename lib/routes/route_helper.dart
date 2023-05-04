import 'package:food_delivery/presentation/account/account_page.dart';
import 'package:food_delivery/presentation/address/address_page.dart';
import 'package:food_delivery/presentation/auth/signup_page.dart';
import 'package:food_delivery/presentation/auth/singin_page.dart';
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
  static const String signUpPage = "/sign-up-page";

  static const String signInPage = "/sign-in-page";

  static const String cartPage = '/cart-page';
  static const String profilePage = '/profile';
  static const String addressPage = '/address-page';

  static const String cartHistoryPage = '/cart-history-page';

  static getLandingPage() => '$landingPage';

  static getInitial() => '$initial';

  static String getRecommendedProductDetail(int pageId, String pageName) =>
      '$recommendedProductDetail?pageId=$pageId&pageName=$pageName';

  static String getPopularProductDetail(int pageId, String pageName) =>
      '$popularProductDetail?pageId=$pageId&pageName=$pageName ';

  static String getSignUpPage() => '$signUpPage';
  static String getSignInPage() => '$signInPage';

  static String getCartPage() => '$cartPage';
  static String getProfilePage() => '$profilePage';
  static String getAddressPage() => '$addressPage';

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
        name: signUpPage,
        page: () {
          return SignUpPage();
        },
        transition: Transition.fade),
    GetPage(
        name: signInPage,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
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
        name: addressPage,
        page: () {
          return AddressPage();
        },
        transition: Transition.fade), 
    GetPage(
        name: cartHistoryPage,
        page: () {
          return CartHistoryPage();
        },
        transition: Transition.fade)
  ];
}
