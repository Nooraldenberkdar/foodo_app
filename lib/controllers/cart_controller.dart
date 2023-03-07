import 'package:flutter/material.dart';
import 'package:foodo_app/data/respository/cart_repo.dart';
import 'package:foodo_app/models/cart_model.dart';
import 'package:foodo_app/models/order_model.dart';
import 'package:foodo_app/models/products_models.dart';
import 'package:get/get.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/constants.dart';

class CartController extends GetxController {
  CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> items = {};
  //so we have a big cart and inside it we may have a lot of products like
  // chikcen*5
  // rice*2 ...etc
  //so we need to know the id of the product and the quantity of it
  //and to know that we need to pass these parameters below
  void addItem(MealModel productModel, int quantity) {
    //if customer add item and want to update he enter here
    var totalQuantity = 0;
    if (items.containsKey(productModel.id!)) {
      //print("product updated ");
      items.update(
        productModel.id!,
        (value) {
          //value==productModel that already exist in cart
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            img: value.img,
            name: value.name,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: productModel,
          ); //it return these updates version of cartItem to items above
        },
      );
      if (totalQuantity <= 0) items.remove(productModel.id);
    } else {
      //if the order is new he enter here
      if (quantity > 0) {
        items.putIfAbsent(
          productModel.id!,
          () {
            //here there is no value=productModel to use in cart
            //print("product id is ${productModel.id} with quantitiy ${quantity}");
            return CartModel(
              id: productModel.id,
              img: productModel.img,
              name: productModel.name,
              price: productModel.price,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: productModel,
            );
          },
        );
      } else {
        Get.snackbar(
          "Itme count 😥",
          "You should add at least one item!",
          backgroundColor: kMainColor,
          colorText: Colors.white,
        );
      }
    }
    // cartRepo.addToCartList(getItems);
    update();
  }
  // 1.scan if item exist in cart previously => update above it   then scan totalQuantity=0 =>remove item from cart
  // 2.if not exist, check the quantity>0 => add cartModel  else show snackbar

  bool existInCart(MealModel productModel) {
    if (items.containsKey(productModel.id)) {
      return true;
    } else
      return false;
  }

  int getQuantity(MealModel productModel) {
    var sum = 0;
    if (items.containsKey(productModel.id)) {
      items.forEach((key, value) {
        if (key == productModel.id) sum = value.quantity!;
      });
    }
    return sum;
  }

  int get totalItems {
    var totalItems = 0;
    items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems {
    return items.entries.map(
      (e) {
        return e.value;
      },
    ).toList();
  }

  int get totalAmount {
    var total = 0;
    items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  void clearCart() {
    items.clear();
    update();
  }

  void checkOut() async {
    print("address id");
    SharedPreferences x = await SharedPreferences.getInstance();
    final location_id = await x.getString(kAddressId);
    print(location_id);

    final items = getItems;
    final numDiffMeals = items.length;
    List<String> meals_id = [];
    for (int i = 0; i < numDiffMeals; i++) {
      for (int j = 0; j < items[i].quantity!.toInt(); j++) {
        meals_id.add(items[i].id!.toString());
      }
    }
    print("meals id");
    print(meals_id);
    final restaurant_id = items[0].product!.restaurantId.toString().trim();
    print("restaurant id");
    print(restaurant_id);
    OrderModel orderModel = OrderModel(location_id: location_id, restaurant_id: restaurant_id, meals_id: meals_id);
    cartRepo.checkOut(orderModel);
  }
}
