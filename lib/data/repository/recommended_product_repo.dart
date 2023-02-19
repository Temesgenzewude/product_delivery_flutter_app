
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_END_POINT);
  }
}
