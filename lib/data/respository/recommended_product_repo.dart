import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

//when you load data from the internet your class should extends GetxService
class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(kRecommendedProductUri);
  }
}
