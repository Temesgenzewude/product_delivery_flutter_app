// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:food_delivery/models/address/address_model.dart';
import 'package:food_delivery/models/response/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/repository/location/location_repo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({
    required this.locationRepo,
  });

  bool _isLoading = false;

  late Position _position;
  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();

  List<AddressModel> _addressList = [];

  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList = [];
  List<AddressModel> get allAddressList => _allAddressList;

  List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;

  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;
  Map<String, dynamic> _getAddress = {};

  bool get isLoading => _isLoading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;

  /*
   For Service zone
   */
  bool _serviceZonePageIsLoading = false;
  bool get serviceZonePageIsLoading => _serviceZonePageIsLoading;
  /*
  whether the user is in service zone or not
  */
  bool _inZone = false;
  bool get inZone => _inZone;
  /*
  for showing and hiding the button as the map loads
  */
  bool _buttonDisabled = true;
  bool get buttonDisabled => _buttonDisabled;

  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;
  bool _updateAddressData = true;
  bool _changeAddressData = true;

  Future<void> getCurrentLocation(bool fromAddressPage,
      {required GoogleMapController mapController,
      LatLng? defaultLatLng,
      bool notify = true}) async {
    _isLoading = true;
  }

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  Future<void> updatePosition(
      CameraPosition cameraPosition, bool fromAddressPage) async {
    if (_updateAddressData) {
      _isLoading = true;
      update();

      try {
        if (fromAddressPage) {
          _position = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }

        ResponseModel _responseModel = await getZone(
            cameraPosition.target.latitude.toString(),
            cameraPosition.target.longitude.toString(),
            false);

        /*
            If button value is false, we are in the service area
            */

        _buttonDisabled = !_responseModel.isSuccess;

        if (_changeAddressData) {
          String _address = await getAddressFromGeocode(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));

          fromAddressPage
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
        }
      } catch (error) {
        print(error.toString());
      }
      _isLoading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknown Location Found";

    Response response = await locationRepo.getAddressFromGeocode(latLng);

    if (response.statusCode == 200) {
      print("Successfully got address");
      if (response.body['status'] != "REQUEST_DENIED") {
        _address = response.body['results'][0]['formatted_address'].toString();
      }

      print("printing address $_address");
    } else {
      print("Error While getting address from google api");
      print(response.body);
    }

    print("printing address $_address");

    update();
    return _address;
  }

  AddressModel getUserAddress() {
    late AddressModel _addressModel;

    _getAddress = jsonDecode(locationRepo.getUserAddress());

    try {
      _addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (error) {
      print(error);
    }

    return _addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addUserAddress(AddressModel addressModel) async {
    _isLoading = true;
    update();

    Response response = await locationRepo.addUserAddress(addressModel);

    ResponseModel responseModel;

    if (response.statusCode == 200) {
      await getAddressList();
      String message = response.body["message"];
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);
    } else {
      print("Couldn't save the user address");
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();

    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();

    if (response.statusCode == 200) {
      _addressList = [];
      _allAddressList = [];
      response.body.forEach((address) {
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    } else {
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }

  Future<bool> saveUserAddress(AddressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());

    return await locationRepo.saveUserAddress(userAddress);
  }

  void clearAddressList() {
    _allAddressList = [];
    _addressList = [];
    update();
  }

  String getUserAddressFromLocalStorage() {
    return locationRepo.getUserAddress();
  }

  void setAddAddressData() {
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  Future<ResponseModel> getZone(
      String lat, String lng, bool markerLoading) async {
    late ResponseModel _responseModel;
    if (markerLoading) {
      _isLoading = true;
    } else {
      _serviceZonePageIsLoading = true;
    }
    update();

    Response _response = await locationRepo.getZone(lat, lng);

    if (_response.statusCode == 200) {
      _inZone = true;
      _responseModel =
          ResponseModel(true, _response.body['zone_id'].toString());
    } else {
      _inZone = false;
      _responseModel = ResponseModel(false, _response.statusText!);
    }
     if (markerLoading) {
      _isLoading =false;
    } else {
      _serviceZonePageIsLoading = false;
    }

    //print(_response.statusCode);

    return _responseModel; 
  }
}
