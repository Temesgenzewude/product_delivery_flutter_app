// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/location/location_controller.dart';
import 'package:food_delivery/presentation/base/custom_button.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/address/search_location_dialogue_page.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMapPage extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController googleMapController;
  const PickAddressMapPage({
    Key? key,
    required this.fromSignup,
    required this.fromAddress,
    required this.googleMapController,
  }) : super(key: key);

  @override
  State<PickAddressMapPage> createState() => _PickAddressMapPageState();
}

class _PickAddressMapPageState extends State<PickAddressMapPage> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(9.005401, 38.763611);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 16);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(
                Get.find<LocationController>().getAddress["longitude"]));

        _cameraPosition = CameraPosition(target: _initialPosition, zoom: 16);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 16),
                    zoomControlsEnabled: true,
                    onCameraMove: (cameraPosition) {
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () {
                      Get.find<LocationController>()
                          .updatePosition(_cameraPosition, false);
                    },
                    onMapCreated: (GoogleMapController mapController) {
                      _mapController=mapController;
                      if(!widget.fromAddress){
                        print("Pick from web");
                        //Get.find<LocationController>().getCurrentLocation()
                      }
                      
                    },
                  ),
                  Center(
                      child: !locationController.isLoading
                          ? Text("PICK ADDRESS",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: AppDimensions.font20,
                                  fontWeight: FontWeight.bold))
                          : CircularProgressIndicator()),
                 /*
                showing and selecting address
                 */
                  Positioned(
                    top: AppDimensions.height45,
                    left: AppDimensions.width20,
                    right: AppDimensions.width20,
                    child: InkWell(
                      onTap: ()=> Get.dialog(LocationDialoguePage(mapController:  _mapController))
                        
                      ,

                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.width10),
                        height: AppDimensions.height25 * 2,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radius10,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: AppDimensions.height25,
                              color: AppColors.yellowColor,
                            ),
                            Expanded(
                              child: Text(
                                '${locationController.pickPlacemark.name ?? "Addis Ababa Ethiopia"}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.font16),
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.width10,
                            ),
                            Icon(
                              Icons.search,
                              size: AppDimensions.iconSize24,
                              color: AppColors.yellowColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: AppDimensions.height10 * 8,
                      left: AppDimensions.width20,
                      right: AppDimensions.width20,
                      child: locationController.serviceZonePageIsLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              buttonText: locationController.inZone
                                  ? widget.fromAddress
                                      ? "Save Address"
                                      : "Save Location"
                                  : "Service is not available in your area!",
                              onPressed: (locationController.buttonDisabled ||
                                      locationController.isLoading)
                                  ? null
                                  : () {
                                      print("Save Address Clicked");
                                      print(
                                          '${locationController.pickPosition.latitude}');
                                      print(
                                          '${locationController.pickPlacemark.name}');

                                      if (locationController
                                                  .pickPosition.latitude !=
                                              0 /*&&
                                          locationController
                                                  .pickPlacemark.name !=
                                              null*/
                                          ) {
                                        print("Well here");
                                        if (widget.fromAddress) {
                                          print("Well here also");
                                          if (widget.googleMapController !=
                                              null) {
                                            print("You can now click on this");
                                            widget.googleMapController.moveCamera(
                                                CameraUpdate.newCameraPosition(
                                                    CameraPosition(
                                                        target: LatLng(
                                                            locationController
                                                                .pickPosition
                                                                .latitude,
                                                            locationController
                                                                .pickPosition
                                                                .longitude))));

                                            locationController
                                                .setAddAddressData();
                                          }
                                          Get.toNamed(
                                              RouteHelper.getAddressPage());
                                        }
                                      }
                                    },
                            )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
