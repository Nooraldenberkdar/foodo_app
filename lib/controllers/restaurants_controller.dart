import 'package:foodo_app/data/respository/restaurants_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/products_models.dart';

class RestaurantsController extends GetxController {
  final RestaurantsRepo restaurantsRepo;
  RestaurantsController({required this.restaurantsRepo});

  List<dynamic> _restaurantsList = [];
  List<dynamic> get restaurantsList => _restaurantsList;

  List<dynamic> _restaurantMeals = [];
  List<dynamic> get restaurantMeals => _restaurantMeals;

  bool _rListIsLoaded = false;
  bool get rListIsLoaded => _rListIsLoaded;

  bool _rMealsIsLoaded = false;
  bool get rMealsIsLoaded => _rMealsIsLoaded;

  Future<void> getRestaurantsList() async {
    Response response = await restaurantsRepo.getRestaurantsList();
    if (response.statusCode == 200) {
      print("got restaurants");
      _restaurantsList = []; //you have to make it empty to avoid repetition
      // _restaurantsList.addAll(Product.fromJson(response.body).products);
      _restaurantsList.addAll(Restaurants.fromJson(response.body).products);
      _rListIsLoaded = true;
      update(); //is something like setState to update ui
    } else {}
  }

  Future<void> getRestaurantMeals(int restaurantId) async {
    Response response = await restaurantsRepo.getRestaurantMeals(restaurantId.toString());
    if (response.statusCode == 200) {
      print("got restaurant Meals");
      _restaurantMeals = []; //you have to make it empty to avoid repetition
      // _restaurantsList.addAll(Product.fromJson(response.body).products);
      _restaurantMeals.addAll(Meals.fromJson(response.body).products);
      _rMealsIsLoaded = true;
      update(); //is something like setState to update ui
    } else {}
  }
}
