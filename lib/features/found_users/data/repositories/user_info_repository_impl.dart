import 'package:eventyle_app/features/found_users/domain/entities/user_info_entity.dart';
import 'package:eventyle_app/features/found_users/domain/repositories/user_info_repository.dart';

import '../datasources/user_info_remote_data_source.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoRemoteDataSource userInfoRemoteDataSource;

  UserInfoRepositoryImpl({required this.userInfoRemoteDataSource});

  @override
  Future<List<UserInfoEntity>> getAllUsers(String searchQuery) async {
    final userInfoModels =
        await userInfoRemoteDataSource.getAllUsers(searchQuery);
    List<UserInfoEntity> userInfoEntities = userInfoModels
        .map((userInfoModels) => userInfoModels as UserInfoEntity)
        .toList();
    return userInfoEntities;
  }
}
