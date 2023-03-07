import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/data/respository/popular_product_repo.dart';
import 'package:foodo_app/models/cart_model.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:foodo_app/models/products_models.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;
  late CartController cartController;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    //print(response.body);
    if (response.statusCode == 200) {
      print("got products");
      //print(response.body);
      _popularProductList = []; //you have to make it empty to avoid repetition
      _popularProductList.addAll(Meals.fromJson(response.body).products);
      _isLoaded = true;

      update(); //is a method in GetX like setState to update ui
    } else {
      //print("not success");
      //print(response.statusCode);
    }
  }

  void setQuantity(bool isIncrement) {
    //based on click of the user if it + ==true -==false
    if (isIncrement) {
      quantity = checkQuantity(quantity + 1);
    } else {
      quantity = checkQuantity(quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Itme count 🙅",
        "you can't add more",
        backgroundColor: kMainColor,
        colorText: Colors.white,
      );
      return 20;
    } else if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Itme count 🙅",
        "you can't reduce more",
        backgroundColor: kMainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        quantity = -_inCartItems;
        return quantity;
      }
      return 0;
    } else
      return quantity;
  }

  void initProduct(MealModel productModel, CartController cartController) {
    quantity = 0;
    _inCartItems = 0;
    this.cartController = cartController;
    var exist = cartController.existInCart(productModel);
    if (exist) _inCartItems = cartController.getQuantity(productModel);
    print("the quantity of this ${productModel.id} is : ${_inCartItems.toString()}");
    //print("exist or not : $exist");
  }

  void addItem(MealModel productModel) {
    cartController.addItem(productModel, quantity);
    quantity = 0;
    _inCartItems = cartController.getQuantity(productModel);
    cartController.items.forEach(
      (key, value) {
        print("id is ${value.id} and quantity is ${value.quantity}");
      },
    );
    update();
  }

  int get totalItems {
    return cartController.totalItems;
  }

  List<CartModel> get getItems {
    return cartController.getItems;
  }

  void clearCart() {
    cartController.clearCart();
    update();
  }
}
