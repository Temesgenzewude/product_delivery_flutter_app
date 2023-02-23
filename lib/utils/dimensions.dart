import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / (screenHeight / 320);

  static double pageViewContainer = screenHeight / (screenHeight / 220);
  static double pageViewTextContainer = screenHeight / (screenHeight / 120);

  //dynamic height padding and margin
  static double height10 = screenHeight / (screenHeight / 10);
  static double height15 = screenHeight / (screenHeight / 15);
  static double height20 = screenHeight / (screenHeight / 20);
  static double height25 = screenHeight / (screenHeight / 25);
  static double height30 = screenHeight / (screenHeight / 30);
  static double height45 = screenHeight / (screenHeight / 45);

  //dynamic height padding and margin
  static double width10 = screenWidth / (screenWidth / 10);
  static double width15 = screenWidth / (screenWidth / 15);
  static double width20 = screenWidth / (screenWidth / 20);
  static double width25 = screenWidth / (screenWidth / 25);
  static double width30 = screenWidth / (screenWidth / 30);
  static double width45 = screenWidth / (screenWidth / 45);

  //font size
  //dynamic height padding and margin
  static double font10 = screenHeight / (screenHeight / 10);
  static double font16 = screenHeight / (screenHeight / 16);
  static double font20 = screenHeight / (screenHeight / 20);
  static double font24 = screenHeight / (screenHeight / 24);
  static double font26 = screenHeight / (screenHeight / 26);

  //radius
  //dynamic height padding and margin
  static double radius10 = screenHeight / (screenHeight / 10);
  static double radius15 = screenHeight / (screenHeight / 15);
  static double radius20 = screenHeight / (screenHeight / 20);
  static double radius25 = screenHeight / (screenHeight / 25);
  static double radius30 = screenHeight / (screenHeight / 30);
  static double radius45 = screenHeight / (screenHeight / 45);

  //icon size

  //dynamic height padding and margin
  static double iconSize10 = screenHeight / (screenHeight / 10);
  static double iconSize16 = screenHeight / (screenHeight / 16);
  static double iconSize20 = screenHeight / (screenHeight / 20);

  static double iconSize24 = screenHeight / (screenHeight / 24);
  static double iconSize30 = screenHeight / (screenHeight / 30);

  //list view size
  static double listViewImgWidthSize120 = screenWidth / (screenWidth / 120);

  static double listViewTextContHeightSize100 =
      screenWidth / (screenWidth / 100);

  //popular product
  static double popularProductImgSize350 = screenHeight / (screenHeight / 350);

  //bottom height
  static double bottomHeightBar = screenHeight / (screenHeight / 120);
}
