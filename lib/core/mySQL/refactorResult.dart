import 'dart:convert';

import 'package:mysql1/mysql1.dart';

Future refactorResult(Results result, String jsonlListName) async {
  List<Map<String, dynamic>> events = [];

  for (var row in result) {
    events.add(row.fields);
  }
  List<Map<String, dynamic>> transformedEvents = events.map((event) {
    return event.map((key, value) {
      if (key == 'id') {
        return MapEntry(key, value);
      } else {
        return MapEntry(key, value.toString());
      }
    });
  }).toList();

  Map<String, dynamic> jsonObject = {
    jsonlListName: transformedEvents,
  };

  String jsonString = jsonEncode(jsonObject);

  print(jsonString);

  return jsonString;
}