import 'package:eventyle_app/features/event/data/datasources/event_remote_data_source.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';
import 'package:eventyle_app/features/profile/domain/entities/profile_info_entity.dart';
import 'package:eventyle_app/features/profile/domain/repositories/profile_info_repository.dart';

import '../datasources/profile_info_remote_data_source.dart';

class ProfileInfoRepositoryImpl implements ProfileInfoRepository {
  final ProfileInfoRemoteDataSource profileInfoRemoteDataSource;

  ProfileInfoRepositoryImpl({required this.profileInfoRemoteDataSource});

  @override
  Future<ProfileInfoEntity> getProfileInfo() async {
    final profileInfoModel =
        await profileInfoRemoteDataSource.getProfileInfo();
    final ProfileInfoEntity profileInfoEntity = ProfileInfoEntity(
      user_id: profileInfoModel.user_id,
      role: profileInfoModel.role,
      name: profileInfoModel.name,
      surname: profileInfoModel.surname,
      description: profileInfoModel.description,
    );
    return profileInfoEntity;
  }
}
