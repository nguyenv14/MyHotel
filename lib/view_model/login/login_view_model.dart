import 'package:flutter/material.dart';
import 'package:my_hotel/data/response/dto_object.dart';
import 'package:my_hotel/model/customer_model.dart';
import 'package:my_hotel/repository/Auth/auth_repository.dart';
import 'package:my_hotel/utils/user_db.dart';

class LoginViewModel extends ChangeNotifier {
  AuthRepository authRepository;
  LoginViewModel({required this.authRepository});
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  //creating getter method to store value of input email
  String _email = '';
  String get email => _email;

  setEmail(String email) {
    _email = email;
  }

  //creating getter method to store value of input password
  String _password = '';
  String get password => _password;

  setPassword(String password) {
    _password = password;
  }

  Future<ObjectDTO> loginApi(
      String customerEmail, String customerPassword) async {
    try {
      setLoginLoading(true);
      var body = {
        "customer_email": customerEmail,
        "customer_password": customerPassword
      };
      final response = await authRepository.checkLogin(body);
      if (response.statusCode == 200) {
        CustomerModel customerModel = CustomerModel.fromJson(response.data);
        CustomerDB.saveCustomer(customerModel);
      }
      setLoginLoading(false);
      return response;
    } catch (e) {
      setLoginLoading(false);
      throw Exception(e);
    }
  }
}
