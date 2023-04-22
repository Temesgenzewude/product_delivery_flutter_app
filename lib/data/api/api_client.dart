import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;

  final String appBaseUrl;
   late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;
 

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    
    token =  sharedPreferences.getString(AppConstants.TOKEN)??"";


    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  void updateHeaders(String token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String url, {Map<String, String>? headers}) async {

    try {
      Response response = await get(url, headers: headers ?? _mainHeaders);

      return response;
    } catch (error) {
      return Response(statusCode: 408, statusText: error.toString());
    }
  }

  Future<Response> postData(String url, dynamic body) async {
    // print(body.toString());

    try {
      Response response = await post(url, body, headers: _mainHeaders);
      // print(response.toString());

      return response;
    } catch (error) {
      // print(error.toString());
      return Response(statusCode: 408, statusText: error.toString());
    }
  }
}
