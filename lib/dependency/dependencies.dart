import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth/auth_controller.dart';
import '../controllers/cart/cart_controller.dart';
import '../controllers/location/location_controller.dart';
import '../controllers/popular_product/popular_product_controller.dart';
import '../controllers/recommended_product/recommended_product_controller.dart';
import '../controllers/user/user_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/auth/auth_repo.dart';
import '../data/repository/cart/cart_repo.dart';
import '../data/repository/location/location_repo.dart';
import '../data/repository/popular_product/popular_products_repo.dart';
import '../data/repository/recommended_prodcut/recommended_product_repo.dart';
import '../data/repository/user/user_repo.dart';
import '../utils/api_end_points.dart';

Future<void> init() async {
  //shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  
}
