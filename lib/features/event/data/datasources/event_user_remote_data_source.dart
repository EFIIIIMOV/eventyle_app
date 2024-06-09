import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/core/utils/token_util.dart';
import 'package:eventyle_app/features/found_users/data/models/user_info_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/get_platform_localhost.dart';
import '../models/event_user_model.dart';

abstract class EventUserRemoteDataSource {
  Future<List<EventUserModel>> getAllUsers(String searchQuery);

  Future<void> addUserToEvent(Map<String, Object> usersList);
}

class EventUserRemoteDataSourceImpl implements EventUserRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<List<EventUserModel>> getAllUsers(String searchQuery) async {
    String encodedQuery = Uri.encodeComponent(searchQuery);

    final response = await http.get(
      Uri.parse('$baseUrl/user/profiles/?searchQuery=$encodedQuery'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final users = jsonDecode(utf8.decode(response.bodyBytes));
      return (users['users'] as List)
          .map((user) => EventUserModel.fromJson(user))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllUsers(searchQuery);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addUserToEvent(Map<String, Object> usersList) async {
    final response = await client.post(
      Uri.parse('$baseUrl/events/add_user/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(usersList),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addUserToEvent(usersList);
    } else {
      throw ServerException();
    }
  }
}
