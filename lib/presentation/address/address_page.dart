import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/location/location_controller.dart';
import '../../controllers/user/user_controller.dart';
import '../../models/address/address_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_textfield_widget.dart';
import '../../widgets/big_text.dart';
import 'pick_address_map_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonNameController =
      TextEditingController();

  final TextEditingController _contactPersonPhoneController =
      TextEditingController();

  late bool _isUserLoggedIn;

  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(9.005401, 38.763611), zoom: 16);

  LatLng _initialPosition = LatLng(9.005401, 38.763611);

  void setPermissions() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      if (!await Permission.location.request().isGranted) {
        var permission = await Permission.location.request();
        if (!permission.isGranted) {
          Get.snackbar(
              "Location Permission", "Location permission is not granted");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setPermissions();
    _isUserLoggedIn = Get.find<AuthController>().userLoggedIn();

    if (_isUserLoggedIn && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      if (Get.find<LocationController>().getUserAddressFromLocalStorage() ==
          "") {
        Get.find<LocationController>()
            .saveUserAddress(Get.find<LocationController>().addressList.last);
      }
      Get.find<LocationController>().getUserAddress();
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress['latitude']),
              double.parse(
                  Get.find<LocationController>().getAddress['longitude'])));

      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (_userController) {
          if (_userController.userModel != null &&
              _contactPersonNameController.text.isEmpty) {
            _contactPersonNameController.text =
                '${_userController.userModel.name}';
            _contactPersonPhoneController.text =
                '${_userController.userModel.phone}';

            if (Get.find<LocationController>().addressList.isNotEmpty) {
              _addressController.text =
                  Get.find<LocationController>().getUserAddress().address;
            }
          }
          return GetBuilder<LocationController>(
            builder: (_locationController) {
              _addressController.text =
                  '${_locationController.placemark.name ?? "Addis Ababa "}'
                  '${_locationController.placemark.locality ?? " ET "}'
                  '${_locationController.placemark.postalCode ?? " 1000 "}'
                  '${_locationController.placemark.country ?? " Ethiopia"}';

              print("Address in my view is ${_addressController.text}");
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppDimensions.font20 * 7,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 / 2,
                          right: AppDimensions.height10 / 2,
                          top: AppDimensions.height10 / 2),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 / 2),
                        border: Border.all(
                            width: AppDimensions.width10 / 5,
                            color: AppColors.mainColor),
                      ),
                      child: Stack(children: [
                        GoogleMap(
                          onTap: (latlng) {
                            Get.toNamed(RouteHelper.getPickAddressMapPage(),
                                arguments: PickAddressMapPage(
                                  fromAddress: true,

                                  fromSignup: false,
                                  googleMapController:
                                      _locationController.mapController,
                                ));
                          },
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 16),
                          zoomControlsEnabled: false,
                          compassEnabled: false,
                          indoorViewEnabled: true,
                          myLocationEnabled: true,
                          mapToolbarEnabled: false,
                          onCameraIdle: () {
                            _locationController.updatePosition(
                                _cameraPosition, true);
                          },
                          onCameraMove: ((position) =>
                              _cameraPosition = position),
                          onMapCreated: (GoogleMapController mapController) {
                            _locationController.setMapController(mapController);
                          },
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppDimensions.width20,
                          top: AppDimensions.height20),
                      child: SizedBox(
                          height: AppDimensions.height25 * 2,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _locationController.addressTypeList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _locationController
                                        .setAddressTypeIndex(index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.width10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppDimensions.width20,
                                        vertical: AppDimensions.height10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.radius10 / 2),
                                        color: Theme.of(context).cardColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[200]!,
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                          ),
                                        ]),
                                    child: Icon(
                                        index == 0
                                            ? Icons.home_filled
                                            : index == 1
                                                ? Icons.work
                                                : Icons.location_on,
                                        color: _locationController
                                                    .addressTypeIndex ==
                                                index
                                            ? AppColors.mainColor
                                            : Theme.of(context).disabledColor),
                                  ),
                                );
                              })),
                    ),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.width25),
                      child: BigText(text: "Delivery Address"),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    AppTextField(
                        textEditingController: _addressController,
                        icon: Icons.map,
                        hintText: "Your Address"),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.width25),
                      child: BigText(text: "Contact Name"),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    AppTextField(
                        textEditingController: _contactPersonNameController,
                        icon: Icons.person,
                        hintText: "Your Name"),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.width25),
                      child: BigText(text: "Contact Phone Number"),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    AppTextField(
                        textEditingController: _contactPersonPhoneController,
                        icon: Icons.phone,
                        hintText: "Your Phone Number"),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar:
          GetBuilder<LocationController>(builder: (_locationController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: AppDimensions.height20 * 8,
            padding: EdgeInsets.only(
                top: AppDimensions.height10,
                bottom: AppDimensions.height10,
                left: AppDimensions.width20,
                right: AppDimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.bottomBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.radius20 * 2),
                topRight: Radius.circular(AppDimensions.radius20 * 2),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  AddressModel addressModel = AddressModel(
                      addressType: _locationController.addressTypeList[
                          _locationController.addressTypeIndex],
                      contactPersonName: _contactPersonNameController.text,
                      contactPersonPhone: _contactPersonPhoneController.text,
                      address: _addressController.text,
                      latitude:
                          _locationController.position.latitude.toString(),
                      longitude:
                          _locationController.position.longitude.toString());

                  _locationController
                      .addUserAddress(addressModel)
                      .then((response) {
                    if (response.isSuccess) {
                      Get.snackbar("Address", "Saved Successfully!");
                      Get.toNamed(RouteHelper.getInitial());
                    } else {
                      Get.snackbar("Address", "Couldn't Saved Address!");
                    }
                  });
                  // popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: AppDimensions.width20,
                      right: AppDimensions.width20,
                      top: AppDimensions.height20,
                      bottom: AppDimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "Save Address",
                    color: Colors.white,
                    size: AppDimensions.font26,
                  ),
                ),
              ),
            ]),
          ),
        ]);
      }),
    );
  }
}
