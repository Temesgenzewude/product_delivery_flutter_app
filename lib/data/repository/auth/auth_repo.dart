// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/models/auth/signup_body_model.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_delivery/data/api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBodyModel signUpBodyModel) async {
    return await apiClient.postData(
        AppConstants.SIGNUP_END_POINT, signUpBodyModel.toJson());
  }

  saveUserToken(String token) async{
    apiClient.token = token;
    apiClient.updateHeaders(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  } 
}
