import 'package:foodo_app/pages/food/popular_food_details.dart';
import 'package:foodo_app/pages/food/recommended_food_details.dart';
import 'package:foodo_app/pages/history/history_page.dart';
import 'package:foodo_app/pages/home/home_page.dart';
import 'package:foodo_app/pages/login/login_page.dart';
import 'package:foodo_app/pages/resturnats/meal_page.dart';
import 'package:foodo_app/pages/resturnats/restaurant_page.dart';
import 'package:foodo_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/cart/cart_page.dart';
import '../pages/resturnats/restaurants_page.dart';

class routeHelper {
  static String splash = '/splash-page';
  static String login = '/login';
  static String initial = '/';
  static String foodDetail = '/food-details';
  static String recommendedFood = '/recommended-food';
  static String cart = '/cartPage';
  static String restaurants = '/restaurants';
  static String restaurant = '/restaurant';
  static String meal = '/meal';
  static String history = '/history';

  static String getSplash() => splash;
  static String getLogin() => login;
  static String getInitial(String oldPage) => '$initial?oldPage=$oldPage';
  static String getPopularFoodDetail(int pageId, String oldPage) => '$foodDetail?pageId=$pageId&oldPage=$oldPage';
  static String getRecommendedFoodDetail(int pageId, String oldPage) => '$recommendedFood?pageId=$pageId&oldPage=$oldPage';
  static String getCartPage(int pageId) => '$cart?pageId=$pageId';
  static String getRestaurantsPage() => restaurants;
  static String getRestaurantPage(int pageId, String oldPage) => '$restaurant?pageId=$pageId&oldPage=$oldPage';
  static String getMealPage(int pageId, String oldaPage) => '$meal?pageId=$pageId&oldPage=$oldaPage';
  static String getHistoryPage() => history;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: history,
      page: () => HistoryPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
        transition: Transition.fadeIn,
        name: initial,
        page: () {
          var oldPage = Get.parameters['oldPage'];
          return HomePage(oldPage: oldPage!);
        }),
    GetPage(
      transition: Transition.fadeIn,
      name: restaurants,
      page: () => RestaurantsPage(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: foodDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        var oldPage = Get.parameters['oldPage'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          oldPage: oldPage!,
        );
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var oldPage = Get.parameters['oldPage'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          oldPage: oldPage!,
        );
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: cart,
      page: () {
        var pageId = Get.parameters['pageId'];
        return CartPage(pageId: int.parse(pageId!));
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: restaurant,
      page: () {
        var pageId = Get.parameters['pageId'];
        var oldPage = Get.parameters['oldPage'];
        return RestaurantPage(
          pageId: int.parse(pageId!),
          oldPage: oldPage!,
        );
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: meal,
      page: () {
        var pageId = Get.parameters['pageId'];
        var oldPage = Get.parameters['oldPage'];
        return MealPage(
          pageId: int.parse(pageId!),
          oldPage: oldPage!,
        );
      },
    ),
  ];
}
