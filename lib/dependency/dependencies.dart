import 'package:food_delivery/controllers/auth/auth_controller.dart';
import 'package:food_delivery/controllers/cart/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/auth/auth_repo.dart';
import 'package:food_delivery/data/repository/cart/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product/popular_products_repo.dart';
import 'package:food_delivery/data/repository/recommended_prodcut/recommended_product_repo.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
