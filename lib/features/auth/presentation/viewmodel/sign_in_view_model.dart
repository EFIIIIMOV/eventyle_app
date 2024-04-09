import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel();

  Future<void> onSignInButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/events');
  }

  Future<void> onForgotTextButtonPressed(BuildContext context) async {
    //Navigator.pushReplacementNamed(context, '/forgotPassword');
  }

  Future<void> onSignUpTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/signUp');
  }
}
