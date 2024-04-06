import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel();

  Future<void> onSignTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/signUp');
  }
}
