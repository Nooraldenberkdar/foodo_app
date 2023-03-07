import 'package:flutter/material.dart';
import 'package:foodo_app/data/respository/cart_repo.dart';
import 'package:foodo_app/models/cart_model.dart';
import 'package:foodo_app/models/order_model.dart';
import 'package:foodo_app/models/products_models.dart';
import 'package:get/get.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';
import '../data/respository/history_repo.dart';
import '../models/history_model.dart';
import '../utilities/constants.dart';

class HistoryController extends GetxController {
  HistoryRepo historyRepo;
  HistoryController({required this.historyRepo});

  List<dynamic> _historyList = [];
  List<dynamic> get historyList => _historyList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getHistoryList() async {
    //these 4 lines for get the token from device and refresh the app with it ,because when we restart the app the token in mainHeaders becomes null because (updateHeader isn't called)
    final y = Get.find<ApiClient>();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final x = await sharedPreferences.getString(kToken);
    y.updateHeader(x!);

    Response response = await historyRepo.getHistory();
    print(response.body);
    if (response.statusCode == 200) {
      print("got history list");
      _historyList = []; //you have to make it empty to avoid repetition
      _historyList.addAll(Histories.fromJson(response.body).histories);
      _isLoaded = true;
      update(); //is something like setState to update ui
    } else {}
  }
}
