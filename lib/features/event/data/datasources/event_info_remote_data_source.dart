import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/event_info_model.dart';

abstract class EventInfoRemoteDataSource {
  Future<List<EventInfoModel>> getAllEventInfo(String idEvent);
}

class EventInfoRemoteDataSourceImpl implements EventInfoRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<EventInfoModel>> getAllEventInfo(String idEvent) async {
    final response = await client
        .get(Uri.parse('http://10.0.2.2:8000/events/info/event_id/$idEvent'));
    if (response.statusCode == 200) {
      final eventInfo = json.decode(utf8.decode(response.bodyBytes));
      return (eventInfo['eventInfo'] as List)
          .map((event) => EventInfoModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
