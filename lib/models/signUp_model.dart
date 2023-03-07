class SignUpModel {
  String phoneNumber;
  SignUpModel({required this.phoneNumber});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["number"] = this.phoneNumber;
    return data;
  }
}
