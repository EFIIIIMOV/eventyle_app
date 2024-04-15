import 'package:flutter/material.dart';

class CreateEventInfoViewModel extends ChangeNotifier {
  CreateEventInfoViewModel();

  Future<void> onSaveEventInfoButtonPressed(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
