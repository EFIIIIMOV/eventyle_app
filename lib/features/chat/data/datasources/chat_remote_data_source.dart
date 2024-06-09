import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import '../../../../core/utils/get_platform_localhost.dart';
import '../../../../core/utils/token_util.dart';
import '../models/chat_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> getAllChats();

  Future<void> addChat(ChatModel chatModel);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<List<ChatModel>> getAllChats() async {
    final response = await client.get(
      Uri.parse('$baseUrl/chats/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final chats = json.decode(utf8.decode(response.bodyBytes));
      return (chats['chats'] as List)
          .map((chat) => ChatModel.fromJson(chat))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllChats();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addChat(ChatModel chatModel) async {
    final Map<String, dynamic> chatData = chatModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/chats/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(chatData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addChat(chatModel);
    } else {
      throw ServerException();
    }
  }
}
