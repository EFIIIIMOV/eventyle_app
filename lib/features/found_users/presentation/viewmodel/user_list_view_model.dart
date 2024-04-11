import 'package:flutter/material.dart';

class UserListViewModel extends ChangeNotifier {
  UserListViewModel();

  Future<void> onNewEventButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventCreate');
  }
}
