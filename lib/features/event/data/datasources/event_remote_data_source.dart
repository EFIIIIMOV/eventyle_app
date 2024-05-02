import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/secure_storage.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getAllEvents();

  Future<void> addEvent(EventModel eventModel);
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<EventModel>> getAllEvents() async {
    final response = await client.get(
      Uri.parse('http://10.0.2.2:8000/events/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 401) {
      final response = await client.post(
        Uri.parse('http://10.0.2.2:8000/auth/token/refresh/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"refresh": "${await getRefreshToken()}"}),
      );
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final String accessToken = responseBody['access'];
      final String refreshToken = responseBody['refresh'];

      await saveTokens(accessToken, refreshToken);

      return await getAllEvents();
    } else if (response.statusCode == 200) {
      final events = json.decode(utf8.decode(response.bodyBytes));
      return (events['events'] as List)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addEvent(EventModel eventModel) async {
    final Map<String, dynamic> eventData = eventModel.toJson();
    eventData['date'] = DateFormat('yyyy-MM-dd').format(eventData['date']!);
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/events/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(eventData),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}
