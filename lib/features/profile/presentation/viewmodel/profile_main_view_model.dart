import 'package:eventyle_app/features/profile/data/datasources/profile_info_remote_data_source.dart';
import 'package:eventyle_app/features/profile/data/repositories/profile_info_repository_impl.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/profile_info_entity.dart';
import '../../domain/usecases/get_profile_info.dart';

class ProfileMainViewModel extends ChangeNotifier {
  final GetProfileInfoUseCase getProfileInfoUseCase = GetProfileInfoUseCase(
    profileInfoRepository: ProfileInfoRepositoryImpl(
      profileInfoRemoteDataSource: ProfileInfoRemoteDataSourceImpl(),
    ),
  );

  ProfileInfoEntity? profileInfoEntity = null;

  ProfileMainViewModel();

  Future<void> getProfileInfo() async {
    profileInfoEntity = await getProfileInfoUseCase.call(null);
    notifyListeners();
  }

  Future<void> onEditProfileInfoButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profileEdit');
  }

  Future<void> onNewPostButtonPressed(BuildContext context) async {
    Navigator.pushNamed(context, '/profilePostCreate');
  }
}
