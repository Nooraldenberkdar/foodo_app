import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/controllers/history_controller.dart';
import 'package:foodo_app/controllers/login_controller.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:foodo_app/controllers/restaurants_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/pages/cart/cart_page.dart';
import 'package:foodo_app/pages/history/history_page.dart';
import 'package:foodo_app/pages/food/popular_food_details.dart';
import 'package:foodo_app/pages/food/recommended_food_details.dart';
import 'package:foodo_app/helper/dependencies.dart' as dep;
import 'package:foodo_app/pages/home/main_food_page.dart';
import 'package:foodo_app/pages/login/login_page.dart';
import 'package:foodo_app/pages/resturnats/restaurant_page.dart';
import 'package:foodo_app/pages/resturnats/restaurants_page.dart';
import 'package:foodo_app/pages/splash/splash_page.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/recommended_product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //to make sure that our dependencies are loaded
  //these two lines for make logout from the app
  SharedPreferences x = await SharedPreferences.getInstance();
  final success = await x.remove(kToken);
  await x.remove(kAddressId);
  await dep.init(); //load dependencies before my app loaded
  runApp(const MyApp());
  // SharedPreferences x = await SharedPreferences.getInstance();
  // final success = await x.getString(kAddressId);
  // print(success);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //MaterialApp + Getx properties = GetMaterialApp
    Get.find<PopularProductController>().getPopularProductList(); //dependency injection (find the instance already created from<..> and use it
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<RestaurantsController>().getRestaurantsList();
    Get.find<CartController>();
    Get.find<LoginController>();
    Get.find<HistoryController>().getHistoryList();

    //this is a way to keep data in memory     part2/1:50:00
    // return GetBuilder<PopularProductController>(builder: (_) {
    //   return GetBuilder<RecommendedProductController>(builder: (_) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //remove debug
      title: 'FOODO DELIVERY APP',
      initialRoute: routeHelper.getSplash(),
      getPages: routeHelper.routes,
      // home: HistoryPage(),
    );
    //   });
    // });
  }
}
