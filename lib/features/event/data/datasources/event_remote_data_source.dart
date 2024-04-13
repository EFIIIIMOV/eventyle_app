import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:flutter/services.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getAllEvents();
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  @override
  Future<List<EventModel>> getAllEvents() async {
    String responce =
        await rootBundle.loadString('assets/json_data/events_data.json');
    if (responce.isNotEmpty) {
      final events = json.decode(responce);
      return (events['events'] as List)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
