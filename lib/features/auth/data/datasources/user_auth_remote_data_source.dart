import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/auth/data/models/user_login_model.dart';
import 'package:eventyle_app/features/auth/data/models/user_register_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/get_platform_localhost.dart';
import '../../../../core/utils/token_util.dart';

abstract class UserAuthRemoteDataSource {
  Future<void> registerUser(UserRegisterModel userRegisterModel);

  Future<void> loginUser(UserLoginModel userLoginModel);
}

class UserAuthRemoteDataSourceImpl extends UserAuthRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<void> registerUser(UserRegisterModel userRegisterModel) async {
    final Map<String, dynamic> userData = userRegisterModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/auth/create/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> loginUser(UserLoginModel userLoginModel) async {
    final Map<String, dynamic> userData = userLoginModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/auth/token/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
    await tokenUtil.saveTokens(
      jsonDecode(response.body)['access'],
      jsonDecode(response.body)['refresh'],
    );
  }
}
