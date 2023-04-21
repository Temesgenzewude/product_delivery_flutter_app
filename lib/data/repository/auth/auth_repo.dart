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

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_END_POINT, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (error) {
      throw error;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = "";
    apiClient.updateHeaders("");

    return true;
  }
}
