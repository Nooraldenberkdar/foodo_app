import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/login_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/models/address_model.dart';
import 'package:foodo_app/models/signUp_model.dart';
import 'package:foodo_app/widgets/theme_helper.dart';
import 'package:foodo_app/widgets/registeration_header.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = Dimension.height50 * 3.4;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();

    TextEditingController nameController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController buildingController = TextEditingController();
    TextEditingController floorController = TextEditingController();
    TextEditingController houseNumberController = TextEditingController();

    void _registeration(LoginController loginController) {
      String phone = phoneController.text.trim();
      String name = nameController.text.trim();
      String location = locationController.text.trim();
      String houseNumber = houseNumberController.text.trim();
      String floor = floorController.text.trim();
      String building = buildingController.text.trim();
      String street = streetController.text.trim();

      if (phone.length == 10) {
        SignUpModel signUpModel = SignUpModel(phoneNumber: phone);
        AddressModel addressModel = AddressModel(name: name, location: location, floor: floor, building: building, houseNumber: houseNumber, street: street);
        loginController.registeration(signUpModel).then((status) {
          if (status.isSuccess) {
            print("token save");
            loginController.createAddress(addressModel).then((status) {
              if (status.isSuccess) {
                print("address save");
              } else {
                print("address false");
              }
            });
          } else {
            print("token false");
          }
        });
        print(signUpModel.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        builder: (loginController) {
          return SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Container(
                  height: _headerHeight,
                  child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(Dimension.height20, Dimension.width10, Dimension.height20, Dimension.width10),
                    margin: EdgeInsets.fromLTRB(Dimension.height20, Dimension.width10, Dimension.height20, Dimension.width10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Signin into your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: Dimension.height30),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: ThemeHelper().textInputDecoration('Phone number', 'ex: 09********'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                      return 'Please enter a valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: ThemeHelper().textInputDecoration('Name', 'Enter your name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: streetController,
                                  decoration: ThemeHelper().textInputDecoration('Street', 'Enter your street'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your street';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: locationController,
                                  decoration: ThemeHelper().textInputDecoration('Location', 'Enter your location'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your location';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: buildingController,
                                  decoration: ThemeHelper().textInputDecoration('Building', 'Enter your building'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your building';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: floorController,
                                  decoration: ThemeHelper().textInputDecoration('Floor', 'Enter your floor'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your floor';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                child: TextFormField(
                                  controller: houseNumberController,
                                  decoration: ThemeHelper().textInputDecoration('House number', 'Enter your house number'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your house number';
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: Dimension.height15),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(Dimension.height30, Dimension.width10, Dimension.height30, Dimension.width10),
                                    child: Text(
                                      'Sign Up'.toUpperCase(),
                                      style: TextStyle(fontSize: Dimension.width20, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _registeration(loginController);
                                      Get.toNamed(routeHelper.getInitial("0"));
                                    } else {
                                      //modify it later
                                      print("error");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
