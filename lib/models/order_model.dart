import 'package:get/get.dart';

class OrderModel {
  String? location_id;
  String? restaurant_id;
  List<String>? meals_id;

  OrderModel({required this.location_id, required this.restaurant_id, required this.meals_id});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["location_id"] = this.location_id;
    data["restaurant_id"] = this.restaurant_id;
    data["meals_id"] = this.meals_id;

    return data;
  }
}
