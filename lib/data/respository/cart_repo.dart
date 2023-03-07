import 'package:get/get_connect/http/src/response/response.dart';

import '../../models/order_model.dart';
import '../../models/signUp_model.dart';
import '../../utilities/constants.dart';
import '../api/api_client.dart';

class CartRepo {
  final ApiClient apiClient;
  CartRepo({required this.apiClient});

  Future<Response> checkOut(OrderModel orderModel) async {
    return await apiClient.postData(kOrderUri, orderModel.toJson());
  }
}
