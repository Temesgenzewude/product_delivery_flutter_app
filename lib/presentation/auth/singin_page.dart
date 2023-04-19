import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_textfield_widget.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var phoneController = TextEditingController();

    var nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(height: AppDimensions.screenHeight * 0.05),
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
          SizedBox(
            height: AppDimensions.height20,
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: AppDimensions.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: AppDimensions.font20 * 3 + AppDimensions.font10,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: AppDimensions.font20,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppDimensions.height20,
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
              icon: Icons.password_outlined,
              hintText: "Password"),
          SizedBox(
            height: AppDimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: "Sign into your account",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: AppDimensions.font16,
                  ),
                ),
              ),
              SizedBox(
                width: AppDimensions.width20,
              ),
            ],
          ),

          SizedBox(
            height: AppDimensions.screenHeight*0.05,
          ),
          //name

          GestureDetector(
            onTap: () {},
            child: Container(
              width: AppDimensions.screenWidth / 2,
              height: AppDimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                  child: BigText(
                text: "Sign In",
                size: AppDimensions.font10 * 3,
                color: Colors.white,
              )),
            ),
          ),

          SizedBox(
            height: AppDimensions.screenHeight * 0.05,
          ),
          RichText(
            text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: AppDimensions.font20,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(RouteHelper.getSignUpPage()),
                    text: "  Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor,
                      fontSize: AppDimensions.font20,
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}