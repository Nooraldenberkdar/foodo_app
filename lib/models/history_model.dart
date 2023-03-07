class Histories {
  late List<HistoryModel> _histories;
  List<HistoryModel> get histories => _histories; //to access products form out of class

  Histories({required products}) {
    _histories = products;
  }

  Histories.fromJson(List<dynamic> json) {
    _histories = <HistoryModel>[]; // creat an empty list of ProductModel
    for (int i = 0; i < json.length; i++) {
      _histories!.add(HistoryModel.fromJson(json[i]));
    }
  }
}

class HistoryModel {
  int? id;
  String? created_at;
  String? updated_at;
  int? is_aproved;
  int? is_canceled;
  int? total;
  int? restaurant_id;
  String? accepted_at;
  int? customer_id;
  String? location_id;

  HistoryModel({
    this.id,
    this.restaurant_id,
    this.location_id,
    this.total,
    this.accepted_at,
    this.created_at,
    this.customer_id,
    this.is_aproved,
    this.is_canceled,
    this.updated_at,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurant_id = json['restaurant_id'];
    location_id = json['location_id'];
    total = json['total'];
    accepted_at = json['accepted_at'];
    created_at = json['created_at'];
    customer_id = json['customer_id'];
    is_aproved = json['is_aproved'];
    is_canceled = json['is_canceled'];
    updated_at = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": this.id,
  //     "name": this.name,
  //     "description": this.description,
  //     "price": this.price,
  //     "image": this.img,
  //     "createdAt": this.createdAt,
  //     "updatedAt": this.updatedAt,
  //     "restaurantId": this.restaurantId,
  //     "categoryId": this.categoryId,
  //   };
  // }
}
