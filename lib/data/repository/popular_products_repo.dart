import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_END_POINT);
  }
}
