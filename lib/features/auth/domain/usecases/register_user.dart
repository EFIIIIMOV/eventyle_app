import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_register_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';

import '../repositories/user_auth_repository.dart';

class RegisterUserUseCase implements UseCase<void, UserRegisterEntity> {
  final UserAuthRepository userAuthRepository;

  RegisterUserUseCase({required this.userAuthRepository});

  @override
  Future<void> call(UserRegisterEntity userRegisterEntity) async {
    return await userAuthRepository.registerUser(userRegisterEntity);
  }
}
