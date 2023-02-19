import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: AppDimensions.height20),
        width: double.maxFinite,
        child: Column(children: [
          //profile icon
          AppIcon(
            icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            size: AppDimensions.height25 * 6,
            iconSize: AppDimensions.height25 * 3,
          ),
          SizedBox(
            height: AppDimensions.height20,
          ),
          //name
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.person,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      size: AppDimensions.height10 * 5,
                      iconSize: AppDimensions.height10 * 5 / 2,
                    ),
                    bigText: BigText(
                      text: "Temesgen",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  //phone
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.phone,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: AppDimensions.height10 * 5,
                      iconSize: AppDimensions.height10 * 5 / 2,
                    ),
                    bigText: BigText(
                      text: "+251934444545",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  //email
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.email,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: AppDimensions.height10 * 5,
                      iconSize: AppDimensions.height10 * 5 / 2,
                    ),
                    bigText: BigText(
                      text: "my@gmail.com",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  //address
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: AppDimensions.height10 * 5,
                      iconSize: AppDimensions.height10 * 5 / 2,
                    ),
                    bigText: BigText(
                      text: "Addis Ababa",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                  //message
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.message_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      size: AppDimensions.height10 * 5,
                      iconSize: AppDimensions.height10 * 5 / 2,
                    ),
                    bigText: BigText(
                      text: "Hello",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height20,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
