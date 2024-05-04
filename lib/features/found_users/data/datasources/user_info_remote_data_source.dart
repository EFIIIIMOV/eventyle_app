import 'dart:convert';

import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/core/utils/token_util.dart';
import 'package:eventyle_app/features/found_users/data/models/user_info_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

abstract class UserInfoRemoteDataSource {
  Future<List<UserInfoModel>> getAllUsers(String searchQuery);
}

class UserInfoRemoteDataSourceImpl implements UserInfoRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );

  @override
  Future<List<UserInfoModel>> getAllUsers(String searchQuery) async {
    String encodedQuery = Uri.encodeComponent(searchQuery);

    final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:8000/user/profiles/?searchQuery=$encodedQuery'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final users = jsonDecode(utf8.decode(response.bodyBytes));
      return (users['users'] as List)
          .map((user) => UserInfoModel.fromJson(user))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllUsers(searchQuery);
    } else {
      throw ServerException();
    }
  }
}
