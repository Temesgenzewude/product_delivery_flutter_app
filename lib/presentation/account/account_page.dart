import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/profile_widgets/profile_widget.dart';

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
                  ProfileWidget(
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
                  ProfileWidget(
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
                  ProfileWidget(
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
                  ProfileWidget(
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
                  ProfileWidget(
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
