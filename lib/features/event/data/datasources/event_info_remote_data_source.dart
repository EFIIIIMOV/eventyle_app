import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:flutter/services.dart';

import '../models/event_info_model.dart';

abstract class EventInfoRemoteDataSource {
  Future<List<EventInfoModel>> getAllEventInfo(int idEvent);
}

class EventInfoRemoteDataSourceImpl implements EventInfoRemoteDataSource {
  @override
  Future<List<EventInfoModel>> getAllEventInfo(int idEvent) async {
    String responce = await rootBundle
        .loadString('assets/json_data/event_${idEvent}_info_data.json');
    if (responce.isNotEmpty) {
      final eventInfo = json.decode(responce);
      return (eventInfo['eventInfo'] as List)
          .map((event) => EventInfoModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
