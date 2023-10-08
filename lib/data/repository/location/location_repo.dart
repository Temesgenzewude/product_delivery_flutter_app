import 'package:get/get_connect.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/address/address_model.dart';
import '../../../utils/api_end_points.dart';
import '../../api/api_client.dart';

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

  Future<Response> getZone(String lat, String lng) async {
    return await apiClient
        .getData('${AppConstants.ZONE_END_POINT}?lat=$lat&lng=$lng');
  }

  Future<Response> searchLocation(String text) async {
    return await apiClient
        .getData('${AppConstants.SEARCH_LOCATION_END_POINT}?search_text=$text');
  }

  Future<Response> setLocation(String placeID) async {
    return await apiClient
        .getData('${AppConstants.PLACE_DETAILS_END_POINT}?placeid=$placeID');
  }
}
