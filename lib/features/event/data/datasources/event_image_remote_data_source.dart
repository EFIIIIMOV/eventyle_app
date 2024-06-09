import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/get_platform_localhost.dart';
import '../../../../core/utils/token_util.dart';
import '../models/event_image_model.dart';

abstract class EventImageRemoteDataSource {
  Future<void> addImageEvent(EventImageModel eventImageModel);
}

class EventImageRemoteDataSourceImpl implements EventImageRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<void> addImageEvent(EventImageModel eventImageModel) async {
    final Map<String, dynamic> eventImageData = eventImageModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/events/image/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(eventImageData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addImageEvent(eventImageModel);
    } else {
      throw ServerException();
    }
  }
}
