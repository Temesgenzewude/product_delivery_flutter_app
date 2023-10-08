import 'package:get/get.dart';

import '../../../utils/api_end_points.dart';
import '../../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_END_POINT);
  }
}
