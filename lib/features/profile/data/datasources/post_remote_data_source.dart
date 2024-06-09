import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/get_platform_localhost.dart';
import '../../../../core/utils/token_util.dart';
import '../models/post_image_model.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts(String user_id);

  Future<void> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );
  final String baseUrl = getBaseUrl();

  @override
  Future<List<PostModel>> getAllPosts(String user_id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/user/profile/post/?user_id=$user_id'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final posts = json.decode(utf8.decode(response.bodyBytes));
      return (posts['posts'] as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await getAllPosts(user_id);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addPost(PostModel postModel) async {
    final Map<String, dynamic> postData = postModel.toJson();
    final response = await client.post(
      Uri.parse('$baseUrl/user/profile/post/create/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addPost(postModel);
    } else {
      throw ServerException();
    }
  }
}
