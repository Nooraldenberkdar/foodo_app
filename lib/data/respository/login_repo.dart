import 'package:foodo_app/data/api/api_client.dart';
import 'package:foodo_app/models/address_model.dart';
import 'package:foodo_app/models/signUp_model.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  final ApiClient apiClient;
  //final SharedPreferences sharedPreferences;
  LoginRepo({required this.apiClient});

  Future<Response> registeration(SignUpModel signUpModel) async {
    return await apiClient.postData(kRegisterUri, signUpModel.toJson());
  }

  Future<Response> createAddress(AddressModel addressModel) async {
    return await apiClient.postData(kCreateAddressUri, addressModel.toJson());
  }

  Future saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(kToken, token);
  }

  Future saveUserInfo(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(kAddressId, id);
  }
}
