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

  static const String popularProduct = "/popular-product";
  static const String recommendedProduct = "/recommended-product";
  static const String signup = "/signup";
  static const String cartPage = '/cart-page';
  static const String profilePage = '/profile';

  static getInitial() => '$initial';

  static String getRecommendedProduct(int pageId) =>
      '$recommendedProduct?pageId=$pageId';

  static String getPopularProduct(int pageId) =>
      '$popularProduct?pageId=$pageId ';

  static String getSignup() => '$signup';
  static String getCartPage() => '$cartPage';
  static String getProfilePage() => '$profilePage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainProductPage()),
    GetPage(
        name: popularProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularProductDetail(
            pageId: int.parse(pageId!),
          );
        }),
    GetPage(
        name: recommendedProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedProductDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: signup,
        page: () {
          return SignUpPage();
        }),
    GetPage(
        name: cartPage,
        page: () {
          return CartDetail();
        }),
    GetPage(
        name: profilePage,
        page: () {
          return AccountPage();
        }),
  ];
}
