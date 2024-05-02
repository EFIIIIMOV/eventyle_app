import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/core/mySQL/mySQL.dart';
import 'package:eventyle_app/features/auth/data/models/user_login_model.dart';
import 'package:eventyle_app/features/auth/data/models/user_register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class UserAuthRemoteDataSource {
  Future<void> registerUser(UserRegisterModel userRegisterModel);

  Future<void> loginUser(UserLoginModel userLoginModel);
}

class UserAuthRemoteDataSourceImpl extends UserAuthRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<void> registerUser(UserRegisterModel userRegisterModel) async {
    final Map<String, dynamic> userData = userRegisterModel.toJson();
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/auth/create/'),
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
      Uri.parse('http://10.0.2.2:8000/auth/token/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
    print(response.body);
  }
}
