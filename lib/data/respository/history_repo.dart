import 'package:get/get_connect/http/src/response/response.dart';

import '../../models/order_model.dart';
import '../../models/signUp_model.dart';
import '../../utilities/constants.dart';
import '../api/api_client.dart';

class HistoryRepo {
  final ApiClient apiClient;
  HistoryRepo({required this.apiClient});

  Future<Response> getHistory() async {
    return await apiClient.getData(kHistoryUri);
  }
}
