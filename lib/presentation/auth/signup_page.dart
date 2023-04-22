import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth/auth_controller.dart';
import 'package:food_delivery/models/auth/signup_body_model.dart';
import 'package:food_delivery/presentation/base/custom_loader.dart';
import 'package:food_delivery/presentation/base/show_custom_snackbar.dart';
import 'package:food_delivery/routes/route_helper.dart';
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
    var singUpOptionsImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Email is required", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Email Should be Valid", title: "Valid Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Password is required", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password must be at least 6 characters long",
            title: "Valid Password");
      } else if (name.isEmpty) {
        showCustomSnackBar("Name is required", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Phone number is required", title: "Phone Number");
      } else {
        SignUpBodyModel signUpBodyModel = SignUpBodyModel(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBodyModel).then((status) {
          if (status.isSuccess) {
            // print("Successfully registered");
            Get.offNamed(RouteHelper.getInitial());

          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authController) {
            return !_authController.isLoading
                ? SingleChildScrollView(
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
                            backgroundImage:
                                AssetImage('assets/images/logo2.jpg'),
                          ),
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
                          isObscure: true,
                          textEditingController: passwordController,
                          icon: Icons.password_outlined,
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

                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: AppDimensions.screenWidth / 2,
                          height: AppDimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                              child: BigText(
                            text: "Sign Up",
                            size: AppDimensions.font10 * 3,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10,
                      ),

                      //tag line
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Get.toNamed(RouteHelper.getSignInPage()),
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
                            fontSize: AppDimensions.font16,
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.all(AppDimensions.height10),
                            child: CircleAvatar(
                              radius: AppDimensions.radius30,
                              backgroundImage: AssetImage(
                                  "images/${singUpOptionsImages[index]}"),
                            ),
                          ),
                        ),
                      )
                    ]),
                  )
                : const CustomLoader();
          },
        ));
  }
}
