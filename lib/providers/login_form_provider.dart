import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';

  LoginFormProvider();

  String get email => _email;
  String get password => _password;

  void setEmail({required String newEmail}) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword({required String newPassword}) {
    _password = newPassword;
    notifyListeners();
  }

  void submit() {
    // Rufe beispielsweise ein Repository auf oÄ
    _email = '';
    _password = '';
    notifyListeners();
  }
}
