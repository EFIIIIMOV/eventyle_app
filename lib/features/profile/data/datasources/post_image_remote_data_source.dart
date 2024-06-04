import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:eventyle_app/core/error/exception.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/token_util.dart';
import '../models/post_image_model.dart';
import '../models/post_model.dart';

abstract class PostImageRemoteDataSource {
  Future<void> addPostImage(List<PostImageModel> postImageModelList);
}

class PostImageRemoteDataSourceImpl implements PostImageRemoteDataSource {
  final http.Client client = http.Client();
  final TokenUtil tokenUtil = TokenUtil(
    flutterSecureStorage: FlutterSecureStorage(),
    client: http.Client(),
  );

  @override
  Future<void> addPostImage(List<PostImageModel> postImageModelList) async {
    List<Map<String, dynamic>> postImageData = postImageModelList
        .map((postImageModel) => postImageModel.toJson())
        .toList();
    final response = await client.post(
      Uri.parse('http://10.0.2.2:8000/user/profile/post/add_image/'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await tokenUtil.getAccessToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postImageData),
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      tokenUtil.updateAccessToken();
      return await addPostImage(postImageModelList);
    } else {
      throw ServerException();
    }
  }
}
