import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:flutter/services.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';

import '../../../../core/mySQL/mySQL.dart';
import '../../../../core/mySQL/refactorResult.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getAllEvents();
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  @override
  Future<List<EventModel>> getAllEvents() async {
    //fetchData();
    // String responce =
    //     await rootBundle.loadString('assets/json_data/events_data.json');
    String responce = await fetchDataFromDB();
    if (responce.isNotEmpty) {
      final events = json.decode(responce);
      return (events['events'] as List)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future fetchDataFromDB() async {
    final connection = await MySQL().getConnection();

    await Future.delayed(const Duration(microseconds: 1));

    var result = await connection.query(
        "SELECT id, name, DATE_FORMAT(date, '%d.%m.%Y') AS date, place, description FROM eventyle_app_test_db.event;");

    connection.close();

    return await refactorResult(result, 'events');
  }
}
