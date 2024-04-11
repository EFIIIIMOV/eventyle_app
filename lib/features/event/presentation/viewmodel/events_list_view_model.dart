import 'package:flutter/material.dart';

class EventsListViewModel extends ChangeNotifier {
  EventsListViewModel();

  Future<void> onNewEventButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventCreate');
  }

  Future<void> onEventPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/eventMain');
  }
}