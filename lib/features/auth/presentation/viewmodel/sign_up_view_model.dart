import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel();

  Future<void> onSignUpButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> onSignInTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/');
  }
}
