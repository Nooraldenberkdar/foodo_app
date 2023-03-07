class AddressModel {
  String name;
  String street;
  String location;
  String building;
  String floor;
  String houseNumber;
  AddressModel({required this.name, required this.location, required this.floor, required this.building, required this.houseNumber, required this.street});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = this.name;
    data["street"] = this.street;
    data["location"] = this.location;
    data["building"] = this.building;
    data["floor"] = this.floor;
    data["house_number"] = this.houseNumber;

    return data;
  }
}
