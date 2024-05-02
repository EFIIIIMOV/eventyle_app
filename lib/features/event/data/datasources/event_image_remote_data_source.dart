import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../models/event_image_model.dart';

abstract class EventImageRemoteDataSource {
  Future<void> addImageEvent(EventImageModel eventImageModel);
}

class EventImageRemoteDataSourceImpl implements EventImageRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<void> addImageEvent(EventImageModel eventImageModel) async {
    final Map<String, dynamic> eventImageData = eventImageModel.toJson();
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/events/image/create/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(eventImageData),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}
