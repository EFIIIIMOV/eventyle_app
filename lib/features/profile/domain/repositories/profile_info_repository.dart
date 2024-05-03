import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/profile/domain/entities/profile_info_entity.dart';

abstract class ProfileInfoRepository {
  Future<ProfileInfoEntity> getProfileInfo();
}
