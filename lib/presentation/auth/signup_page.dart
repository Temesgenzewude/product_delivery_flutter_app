import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_textfield_widget.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var phoneController = TextEditingController();

    var nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: AppDimensions.screenHeight * 0.05,
        ),
        //app logo

        Container(
          height: AppDimensions.screenHeight * 0.25,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: AppDimensions.radius20 * 4,
              backgroundImage: AssetImage('assets/images/logo2.jpg'),
            ),
          ),
        ),
        // email
        AppTextField(
            textEditingController: emailController,
            icon: Icons.email,
            hintText: "Email"),
        SizedBox(
          height: AppDimensions.height20,
        ),
        //password
        AppTextField(
            textEditingController: passwordController,
            icon: Icons.password_sharp,
            hintText: "Password"),
        SizedBox(
          height: AppDimensions.height20,
        ),
        //name
        AppTextField(
            textEditingController: nameController,
            icon: Icons.person,
            hintText: "Name"),
        SizedBox(
          height: AppDimensions.height20,
        ),
        //phone
        AppTextField(
            textEditingController: phoneController,
            icon: Icons.phone,
            hintText: "Phone"),
        SizedBox(
          height: AppDimensions.height20,
        ),

        Container(
          width: AppDimensions.screenWidth / 2,
          height: AppDimensions.screenHeight / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radius30),
            color: AppColors.mainColor,
          ),
          child: Center(
              child: BigText(
            text: "Sign Up",
            size: AppDimensions.font10 * 3,
            color: Colors.white,
          )),
        ),
        SizedBox(
          height: AppDimensions.height10,
        ),

        //tag line
        RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
            text: "Have an account already?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: AppDimensions.font20,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.screenHeight * 0.05,
        ),
        RichText(
          text: TextSpan(
            text: "Signup using the following options",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: AppDimensions.font20,
            ),
          ),
        ),
      ]),
    );
  }
}
