import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth/auth_controller.dart';
import 'package:food_delivery/controllers/location/location_controller.dart';
import 'package:food_delivery/controllers/user/user_controller.dart';
import 'package:food_delivery/presentation/base/custom_loader.dart';
import 'package:food_delivery/presentation/base/show_custom_snackbar.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/profile_widgets/profile_widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart/cart_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isUserLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isUserLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: AppDimensions.font24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (_userController) {
            return _isUserLoggedIn
                ? (_userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: AppDimensions.height20),
                        child: Column(children: [
                          // profile icon
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize:
                                AppDimensions.height45 + AppDimensions.height30,
                            size: AppDimensions.height30 * 5,
                          ),
                          SizedBox(
                            height: AppDimensions.height30,
                          ),
                          // name
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ProfileWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: AppDimensions.height25,
                                      size: AppDimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: _userController.userModel.name),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                  // phone
                                  ProfileWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: AppDimensions.height25,
                                      size: AppDimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: _userController.userModel.phone,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                  //email
                                  ProfileWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: AppDimensions.height25,
                                      size: AppDimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: _userController.userModel.email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                  // address
                                  GetBuilder<LocationController>(
                                      builder: (_locationController) {
                                    if (_isUserLoggedIn &&
                                        _locationController
                                            .addressList.isEmpty) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: ProfileWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.location_on,
                                            backgroundColor:
                                                AppColors.yellowColor,
                                            iconColor: Colors.white,
                                            iconSize: AppDimensions.height25,
                                            size: AppDimensions.height10 * 5,
                                          ),
                                          bigText: BigText(
                                            text: "Fill Your Address",
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: ProfileWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.location_on,
                                            backgroundColor:
                                                AppColors.yellowColor,
                                            iconColor: Colors.white,
                                            iconSize: AppDimensions.height25,
                                            size: AppDimensions.height10 * 5,
                                          ),
                                          bigText: BigText(
                                            text: "Your Address",
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                  // messages
                                  ProfileWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: AppDimensions.height25,
                                      size: AppDimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Hi there",
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>()
                                            .clearFromCart();
                                        Get.find<CartController>()
                                            .clearCartHistoryList();
                                        Get.find<LocationController>()
                                            .clearAddressList();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      } else {
                                        showCustomSnackBar(
                                            "Your are not logged in",
                                            title: "Not Logged In");
                                      }
                                    },
                                    child: ProfileWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout_outlined,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: AppDimensions.height25,
                                        size: AppDimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                        text: "Logout",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      )
                    : const CustomLoader())
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height20 * 15,
                            height: AppDimensions.height20 * 10,
                            margin: EdgeInsets.only(
                              left: AppDimensions.width20,
                              right: AppDimensions.width20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("/images/delivery_logo3.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getSignInPage());
                            },
                            child: Container(
                              width: double.maxFinite,
                              height: AppDimensions.height20 * 5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.width20,
                                right: AppDimensions.width20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20),
                              ),
                              child: Center(
                                child: BigText(
                                  text: "Sign in",
                                  size: AppDimensions.font26,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
