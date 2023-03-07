import 'package:foodo_app/data/respository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:foodo_app/models/products_models.dart';

import '../data/respository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("got products recommended");
      _recommendedProductList = []; //you have to make it empty to avoid repetition
      _recommendedProductList.addAll(Meals.fromJson(response.body).products);
      _isLoaded = true;

      update(); //is something like setState to update ui
    } else {}
  }
}
