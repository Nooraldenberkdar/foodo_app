import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.66;
  static double pageViewContainer = screenHeight / 3.88; //simulatorHeight/containerHeight=factor
//which is 854/220=3.88
  static double pageViewTextContainer = screenHeight / 7.11;
  //  (screen Height =854/ textContainer height =120) =7.11
  static double height5 = screenHeight / 170.8;
  static double height10 = screenHeight / 85.4;
  static double height15 = screenHeight / 56.3;
  static double height20 = screenHeight / 42.7;
  static double height30 = screenHeight / 28.46;
  static double height50 = screenHeight / 17.0;

  //fonts
  static double font20 = screenHeight / 42.7;
  static double font12 = screenHeight / 71.16;
  static double font26 = screenHeight / 32.84;

  //radius
  static double radius15 = screenHeight / 56.3;
  static double radius20 = screenHeight / 42.7;
  static double radius30 = screenHeight / 28.4;
  //widths
  static double width5 = screenHeight / 170.8;
  static double width10 = screenHeight / 85.4;
  static double width12 = screenHeight / 71.16;
  static double width15 = screenHeight / 56.3;
  static double width20 = screenHeight / 42.7;
  static double width30 = screenHeight / 28.46;
  static double width50 = screenHeight / 17.0;
  //icon size
  static double iconSize25 = screenHeight / 34.16;
  static double iconSize15 = screenHeight / 56.93;
  static double iconSize40 = screenHeight / 21.35;
  //list view sizes
  static double listViewImgSize = screenWidth / 4;
  static double listViewTextCon = screenWidth / 4.8;
  //popular food
  static double popularFoodImgSize = screenHeight / 2.50;
  //bottombar
  static double bottomHeightBar = screenHeight / 7.11;
  //textHeight
  static double textHeight = screenHeight / 5.63;
  //Expanded height
  static double expandedImgHeight = screenHeight / 2.13;
}
