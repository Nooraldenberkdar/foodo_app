class Meals {
  late List<MealModel> _products;
  List<MealModel> get products => _products; //to access products form out of class

  Meals({required products}) {
    _products = products;
  }

  Meals.fromJson(List<dynamic> json) {
    _products = <MealModel>[]; // creat an empty list of ProductModel
    for (int i = 0; i < json.length; i++) {
      _products!.add(MealModel.fromJson(json[i]));
    }
    //print(_products);
  }
}

class MealModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? restaurantId;
  int? categoryId;

  MealModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.restaurantId,
    this.categoryId,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    img = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "price": this.price,
      "image": this.img,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "restaurantId": this.restaurantId,
      "categoryId": this.categoryId,
    };
  }
}

class Restaurants {
  late List<RestaurantModel> _products;
  List<RestaurantModel> get products => _products; //to access products form out of class

  Restaurants({required products}) {
    _products = products;
  }

  Restaurants.fromJson(List<dynamic> json) {
    _products = <RestaurantModel>[]; // creat an empty list of ProductModel
    for (int i = 0; i < json.length; i++) {
      _products!.add(RestaurantModel.fromJson(json[i]));
    }
    // print(_products);
  }
}

class RestaurantModel {
  int? id;
  String? name;
  String? locationId;
  String? categoryId;
  String? img;
  int? rating;
  int? numberOfRating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.locationId,
    required this.categoryId,
    required this.img,
    required this.rating,
    required this.numberOfRating,
  });
  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    img = json['image'].toString();
    rating = json['rating'];
    numberOfRating = json['number_of_rating'];
  }
}
