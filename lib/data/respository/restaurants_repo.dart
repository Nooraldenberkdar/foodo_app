import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../utilities/constants.dart';
import '../api/api_client.dart';

class RestaurantsRepo extends GetxService {
  final ApiClient apiClient;
  RestaurantsRepo({required this.apiClient});

  Future<Response> getRestaurantsList() async {
    return await apiClient.getData(kRestaurantsUri);
  }

  Future<Response> getRestaurantMeals(String restaurantId) async {
    return await apiClient.getData(kRestaurantMealsUri + restaurantId);
  }
}
