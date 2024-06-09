import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../../../../core/utils/get_platform_localhost.dart';
import '../../../../core/utils/token_util.dart';
import '../models/chat_image_model.dart';

abstract class ChatImageRemoteDataSource {
  Future<void> addImageChat(ChatImageModel chatImageModel);
}

class ChatImageRemoteDataSourceImpl implements ChatImageRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<void> addImageChat(ChatImageModel chatImageModel) async {
    final Map<String, dynamic> chatImageData = chatImageModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/chats/add_image/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(chatImageData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addImageChat(chatImageModel);
    } else {
      throw ServerException();
    }
  }
}
