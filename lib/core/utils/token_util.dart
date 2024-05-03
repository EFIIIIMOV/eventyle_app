import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class TokenUtil {
  FlutterSecureStorage flutterSecureStorage;
  http.Client client;

  TokenUtil({required this.flutterSecureStorage, required this.client});

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await flutterSecureStorage.write(key: 'accessToken', value: accessToken);
    await flutterSecureStorage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await flutterSecureStorage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return await flutterSecureStorage.read(key: 'refreshToken');
  }

  Future<void> updateAccessToken() async {
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/auth/token/refresh/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"refresh": "${await getRefreshToken()}"}),
    );

    await saveTokens(
      jsonDecode(response.body)['access'],
      jsonDecode(response.body)['refresh'],
    );
  }
}
