import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/controllers/history_controller.dart';
import 'package:foodo_app/controllers/login_controller.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:foodo_app/controllers/restaurants_controller.dart';
import 'package:foodo_app/data/api/api_client.dart';
import 'package:foodo_app/data/respository/cart_repo.dart';
import 'package:foodo_app/data/respository/history_repo.dart';
import 'package:foodo_app/data/respository/login_repo.dart';
import 'package:foodo_app/data/respository/popular_product_repo.dart';
import 'package:foodo_app/data/respository/restaurants_repo.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/respository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: kBaseUrl)); // lazyput call it only create the instance and it is instantiated only when you want to use it(save memeory)
  Get.lazyPut(() => LoginRepo(apiClient: Get.find()));
//repos
  Get.lazyPut(() => RestaurantsRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // .find() menas find my instance required here
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(apiClient: Get.find()));
  Get.lazyPut(() => HistoryRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => LoginController(loginRepo: Get.find()));
  Get.lazyPut(() => RestaurantsController(restaurantsRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => HistoryController(historyRepo: Get.find()));
}
