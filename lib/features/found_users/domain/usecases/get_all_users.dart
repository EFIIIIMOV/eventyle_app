import 'package:eventyle_app/core/usecases/usecase.dart';

import '../entities/user_info_entity.dart';
import '../repositories/user_info_repository.dart';

class GetAllUsersUseCase implements UseCase<List<UserInfoEntity>, String> {
  final UserInfoRepository userInfoRepository;

  GetAllUsersUseCase({required this.userInfoRepository});

  @override
  Future<List<UserInfoEntity>> call(String searchQuery) async {
    return await userInfoRepository.getAllUsers(searchQuery);
  }
}
