import 'package:eventyle_app/features/profile/data/datasources/profile_info_remote_data_source.dart';
import 'package:eventyle_app/features/profile/data/repositories/profile_info_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/utils/token_util.dart';
import '../../../profile/domain/usecases/get_profile_info.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/user_post_entity.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/usecases/get_post.dart';
import 'package:http/http.dart' as http;

class UserProfileMainViewModel extends ChangeNotifier {
  final GetProfileInfoUseCase getProfileInfoUseCase = GetProfileInfoUseCase(
    profileInfoRepository: ProfileInfoRepositoryImpl(
      profileInfoRemoteDataSource: ProfileInfoRemoteDataSourceImpl(),
    ),
  );

  final GetPostUseCase getPostUseCase = GetPostUseCase(
    postRepository: PostRepositoryImpl(
      postRemoteDataSource: PostRemoteDataSourceImpl(),
    ),
  );

  UserProfileMainViewModel();

  List<PostEntity> posts = [];
  String userId = '';

  // Future<void> getProfileInfo() async {
  //   userInfoEntity = await getProfileInfoUseCase.call(null);
  //   notifyListeners();
  // }

  Future<void> onEditProfileInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profileEdit');
  }

  Future<void> onNewPostButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profilePostCreate');
  }

  Future<void> getAllPosts(String user_id) async {
    posts = await getPostUseCase.call(user_id);
    notifyListeners();
  }
}
