import 'package:eventyle_app/features/auth/domain/entities/user_login_entity.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_register_entity.dart';

abstract class UserAuthRepository {
  Future<void> registerUser(UserRegisterEntity userRegisterEntity);

  Future<void> loginUser(UserLoginEntity userLoginInfoEntity);
}
