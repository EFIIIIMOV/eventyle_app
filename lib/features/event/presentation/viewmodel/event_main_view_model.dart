import 'package:flutter/material.dart';

class EventMainViewModel extends ChangeNotifier {
  EventMainViewModel();

  Future<void> onNewInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventInfoCreate');
  }
}