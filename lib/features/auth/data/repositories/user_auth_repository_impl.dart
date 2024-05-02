import 'package:eventyle_app/features/auth/data/models/user_login_model.dart';
import 'package:eventyle_app/features/auth/data/models/user_register_model.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_login_entity.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_register_entity.dart';
import 'package:eventyle_app/features/auth/domain/repositories/user_auth_repository.dart';

import '../datasources/user_auth_remote_data_source.dart';

class UserAuthRepositoryImpl extends UserAuthRepository {
  final UserAuthRemoteDataSource userAuthRemoteDataSource;

  UserAuthRepositoryImpl({required this.userAuthRemoteDataSource});

  @override
  Future<void> registerUser(UserRegisterEntity userRegisterEntity) async {
    final UserRegisterModel userRegisterModel = UserRegisterModel(
      user_id: userRegisterEntity.user_id,
      email: userRegisterEntity.email,
      password: userRegisterEntity.password,
      image: userRegisterEntity.image,
      role: userRegisterEntity.role,
      name: userRegisterEntity.name,
      surname: userRegisterEntity.surname,
      aboutUser: userRegisterEntity.aboutUser,
    );
    await userAuthRemoteDataSource.registerUser(userRegisterModel);
  }

  @override
  Future<void> loginUser(UserLoginEntity userLoginEntity) async {
    final UserLoginModel userLoginModel = UserLoginModel(
      email: userLoginEntity.email,
      password: userLoginEntity.password,
    );
    await userAuthRemoteDataSource.loginUser(userLoginModel);
  }
}
