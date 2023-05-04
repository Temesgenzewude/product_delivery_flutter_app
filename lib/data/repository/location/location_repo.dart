// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/models/address/address_model.dart';
import 'package:food_delivery/utils/api_end_points.dart';
import 'package:get/get_connect.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_delivery/data/api/api_client.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    return await apiClient.getData('${AppConstants.GEOCODE_END_POINT}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS) ?? "";
  }

  Future<Response> addUserAddress(AddressModel addressModel) async {
    return await apiClient.postData(
        AppConstants.ADD_USER_ADDRESS_END_POINT, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {
    return await apiClient.getData(
      AppConstants.USER_ADDRESS_LIST_END_POINT,
    );
  }

  Future<bool> saveUserAddress(String address) async {
    apiClient.updateHeaders(sharedPreferences.getString(AppConstants.TOKEN)!);
    return await sharedPreferences.setString(
        AppConstants.USER_ADDRESS, address);
  }
}
