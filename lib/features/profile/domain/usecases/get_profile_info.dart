import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';
import 'package:eventyle_app/features/profile/domain/repositories/profile_info_repository.dart';
import '../entities/profile_info_entity.dart';
import '../repositories/profile_info_repository.dart';

class GetProfileInfoUseCase implements UseCase<ProfileInfoEntity, void> {
  final ProfileInfoRepository profileInfoRepository;

  GetProfileInfoUseCase({required this.profileInfoRepository});

  @override
  Future<ProfileInfoEntity> call(void params) async {
    return await profileInfoRepository.getProfileInfo();
  }
}
