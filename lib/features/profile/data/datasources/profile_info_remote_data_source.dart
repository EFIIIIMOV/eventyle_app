import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/token_util.dart';
import '../models/profile_info_model.dart';

abstract class ProfileInfoRemoteDataSource {
  Future<ProfileInfoModel> getProfileInfo();
}

class ProfileInfoRemoteDataSourceImpl implements ProfileInfoRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );

  @override
  Future<ProfileInfoModel> getProfileInfo() async {
    final response = await client.get(
      Uri.parse('http://10.0.2.2:8000/user/profile'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final profileInfo = json.decode(utf8.decode(response.bodyBytes));
      return ProfileInfoModel.fromJson(profileInfo['profileInfo']);
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getProfileInfo();
    } else {
      throw ServerException();
    }
  }
}
