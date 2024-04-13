import 'package:flutter/material.dart';

import '../../domain/entities/event_entity.dart';

class EventMainViewModel extends ChangeNotifier {
  EventMainViewModel();

  Future<void> onNewInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventInfoCreate');
  }
}