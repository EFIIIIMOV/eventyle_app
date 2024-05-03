import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/token_util.dart';
import '../models/event_info_model.dart';

abstract class EventInfoRemoteDataSource {
  Future<List<EventInfoModel>> getAllEventInfo(String idEvent);

  Future<void> addEventInfo(EventInfoModel eventInfoModel);
}

class EventInfoRemoteDataSourceImpl implements EventInfoRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );

  @override
  Future<List<EventInfoModel>> getAllEventInfo(String idEvent) async {
    final response = await client.get(
      Uri.parse('http://10.0.2.2:8000/events/info/event_id/$idEvent'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final eventInfo = json.decode(utf8.decode(response.bodyBytes));
      return (eventInfo['eventInfo'] as List)
          .map((event) => EventInfoModel.fromJson(event))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllEventInfo(idEvent);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addEventInfo(EventInfoModel eventInfoModel) async {
    final Map<String, dynamic> eventInfoData = eventInfoModel.toJson();
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/events/info/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(eventInfoData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addEventInfo(eventInfoModel);
    } else {
      throw ServerException();
    }
  }
}
