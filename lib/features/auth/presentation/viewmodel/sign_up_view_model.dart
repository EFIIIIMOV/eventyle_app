import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel();

  Future<void> onSignTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/');
  }
}
