import 'package:flutter/material.dart';

class ProfileMainViewModel extends ChangeNotifier {
  ProfileMainViewModel();

  Future<void> onEditProfileInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profileEdit');
  }

  Future<void> onNewPostButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profilePostCreate');
  }
}
