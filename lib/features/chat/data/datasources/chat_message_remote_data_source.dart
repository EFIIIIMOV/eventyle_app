import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import '../../../../core/utils/token_util.dart';
import '../models/chat_message_model.dart';
import '../models/chat_model.dart';

abstract class ChatMessageRemoteDataSource {
  Future<List<ChatMessageModel>> getAllChatMessages(String chat_id);

  Future<void> addChatMessage(ChatMessageModel chatMessageModel);
}

class ChatMessageRemoteDataSourceImpl implements ChatMessageRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );

  @override
  Future<List<ChatMessageModel>> getAllChatMessages(String chat_id) async {
    final response = await client.get(
      Uri.parse('http://10.0.2.2:8000/chats/message/?chat_id=$chat_id'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final messages = json.decode(utf8.decode(response.bodyBytes));
      return (messages['messages'] as List)
          .map((message) => ChatMessageModel.fromJson(message))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllChatMessages(chat_id);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addChatMessage(ChatMessageModel chatMessageModel) async {
    final Map<String, dynamic> messageData = chatMessageModel.toJson();
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/message/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(messageData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addChatMessage(chatMessageModel);
    } else {
      throw ServerException();
    }
  }
}
