import 'package:eventyle_app/features/auth/domain/entities/user_login_entity.dart';
import 'package:eventyle_app/features/auth/domain/repositories/user_auth_repository.dart';

import '../../../../core/usecases/usecase.dart';

class LoginUserUseCase implements UseCase<void, UserLoginEntity> {
  final UserAuthRepository userAuthRepository;

  LoginUserUseCase({required this.userAuthRepository});

  @override
  Future<void> call(UserLoginEntity userLoginEntity) async {
    return await userAuthRepository.loginUser(userLoginEntity);
  }
}
