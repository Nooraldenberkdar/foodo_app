import 'package:foodo_app/data/api/api_client.dart';
import 'package:foodo_app/models/address_model.dart';
import 'package:foodo_app/models/response_model.dart';
import 'package:foodo_app/models/signUp_model.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get.dart';

import '../data/respository/login_repo.dart';

class LoginController extends GetxController implements GetxService {
  final LoginRepo loginRepo;
  LoginController({required this.loginRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAddressLoading = false;
  bool get isAddressLoading => _isAddressLoading;

  Future<ResponseModel> registeration(SignUpModel signUpModel) async {
    //print("4");
    _isLoading = true;
    Response response = await loginRepo.registeration(signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      loginRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
      //print(response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.body["token"]);
      print(response.statusCode);
      //print(response.body["token"]);
    }
    _isLoading = true;
    update();
    return responseModel;
  }

  Future<ResponseModel> createAddress(AddressModel addressModel) async {
    print("4");
    _isAddressLoading = true;
    Response response = await loginRepo.createAddress(addressModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("5");
      loginRepo.saveUserInfo(response.body["id"].toString());
      responseModel = ResponseModel(true, response.body["id"].toString());
      //print(response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.body["id"].toString());
      print(response.statusCode);
      //print(response.body["token"]);
    }
    _isAddressLoading = true;
    update();
    return responseModel;
  }
}
