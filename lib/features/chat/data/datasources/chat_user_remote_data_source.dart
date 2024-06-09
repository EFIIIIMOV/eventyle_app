import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/core/utils/token_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/get_platform_localhost.dart';
import '../models/chat_user_model.dart';

abstract class ChatUserRemoteDataSource {
  Future<List<ChatUserModel>> getAllUsers(String searchQuery);

  Future<List<ChatUserModel>> getChatUsers(String chat_id);

  Future<void> addUserToChat(Map<String, Object> usersList);
}

class ChatUserRemoteDataSourceImpl implements ChatUserRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<List<ChatUserModel>> getAllUsers(String searchQuery) async {
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
      print(users);
      return (users['users'] as List)
          .map((user) => ChatUserModel.fromJson(user))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllUsers(searchQuery);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ChatUserModel>> getChatUsers(String chat_id) async {
    String encodedChat_id = Uri.encodeComponent(chat_id);
    final response = await http.get(
      Uri.parse('$baseUrl/chats/users/?chat_id=$encodedChat_id'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final users = jsonDecode(utf8.decode(response.bodyBytes));
      print(users);
      return (users['users'] as List)
          .map((user) => ChatUserModel.fromJson(user))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllUsers(chat_id);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addUserToChat(Map<String, Object> usersList) async {
    final response = await client.post(
      Uri.parse('$baseUrl/chats/add_user/'),
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
      return await addUserToChat(usersList);
    } else {
      throw ServerException();
    }
  }
}
