import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth/auth_controller.dart';
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
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: AppDimensions.height20),
        child: Column(children: [
          // profile icon
          AppIcon(
            icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: AppDimensions.height45 + AppDimensions.height30,
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
                      text: "Abebe",
                    ),
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
                      text: "+1448909856",
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
                      text: "myemail@gmail.com",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  // address
                  ProfileWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      iconSize: AppDimensions.height25,
                      size: AppDimensions.height10 * 5,
                    ),
                    bigText: BigText(
                      text: "New York City 21st Street, New York,",
                    ),
                  ),
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
                      if (Get.find<AuthController>().userLoggedIn()) {
                        Get.find<AuthController>().clearSharedData();
                        Get.find<CartController>().clearFromCart();
                        Get.find<CartController>().clearCartHistoryList();
                        Get.offNamed(RouteHelper.getSignInPage());
                      } else {
                        showCustomSnackBar("Your are not logged in",
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
      ),
    );
  }
}
