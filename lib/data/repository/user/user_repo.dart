// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({
    required this.apiClient,
  });
  

 Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.USER_INFO_END_POINT);
  }
}
