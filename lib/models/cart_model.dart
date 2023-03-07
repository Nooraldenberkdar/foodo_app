import 'package:foodo_app/models/products_models.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  MealModel? product;

  CartModel({this.id, this.name, this.price, this.img, this.quantity, this.isExist, this.time, this.product});

  //this method take map(json file) and mapping them to CartModel properties and return an instance of CartModel
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = MealModel.fromJson(json['product']);
  }

  //convert the CartModel instance into json map
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson(),
    };
  }
}
