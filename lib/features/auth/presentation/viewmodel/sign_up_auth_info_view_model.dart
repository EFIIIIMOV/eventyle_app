import 'package:flutter/material.dart';

class SignUpAuthInfoViewModel extends ChangeNotifier {
  SignUpAuthInfoViewModel();

  Future<void> onSignUpNextButtonPressed({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    Navigator.pushNamed(context, '/signUpUserInfo', arguments: {
      'email': email,
      'password': password,
    });
  }

  Future<void> onSignInTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/');
  }
}
