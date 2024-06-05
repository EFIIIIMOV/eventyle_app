import 'package:eventyle_app/features/event/domain/usecases/get_all_event.dart';
import 'package:eventyle_app/features/found_users/data/datasources/user_info_remote_data_source.dart';
import 'package:eventyle_app/features/found_users/data/repositories/user_info_repository_impl.dart';
import 'package:eventyle_app/features/found_users/domain/entities/user_info_entity.dart';
import 'package:eventyle_app/features/found_users/domain/usecases/get_all_users.dart';
import 'package:flutter/material.dart';

class UserListViewModel extends ChangeNotifier {
  final GetAllUsersUseCase getAllUsersUseCase = GetAllUsersUseCase(
    userInfoRepository: UserInfoRepositoryImpl(
      userInfoRemoteDataSource: UserInfoRemoteDataSourceImpl(),
    ),
  );

  List<UserInfoEntity> listUsersInfo = [];

  String searchQuery = "";

  Future<void> getListUsersInfo() async {
    print(searchQuery);
    listUsersInfo = await getAllUsersUseCase.call(searchQuery);
    notifyListeners();
  }

  Future<void> filterResult(String newSearchQuery) async {
    searchQuery = newSearchQuery;
    await this.getListUsersInfo();
    notifyListeners();
  }

  Future<void> onUserPressed(BuildContext context, int index) async {
    Navigator.pushNamed(context, '/userProfile',
        arguments: {'user': listUsersInfo[index]});
  }
}
