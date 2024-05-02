import 'package:eventyle_app/features/auth/data/datasources/user_auth_remote_data_source.dart';
import 'package:eventyle_app/features/auth/data/repositories/user_auth_repository_impl.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_login_entity.dart';
import 'package:eventyle_app/features/auth/domain/repositories/user_auth_repository.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/login_user.dart';

class SignInViewModel extends ChangeNotifier {
  final LoginUserUseCase loginUserUseCase = LoginUserUseCase(
    userAuthRepository: UserAuthRepositoryImpl(
      userAuthRemoteDataSource: UserAuthRemoteDataSourceImpl(),
    ),
  );

  SignInViewModel();

  Future<void> onSignInButtonPressed({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final UserLoginEntity userLoginEntity = UserLoginEntity(
      email: email,
      password: password,
    );
    await loginUserUseCase.call(userLoginEntity);
    //Navigator.pushReplacementNamed(context, '/events');
  }

  Future<void> onForgotTextButtonPressed(BuildContext context) async {
    //Navigator.pushReplacementNamed(context, '/forgotPassword');
  }

  Future<void> onSignUpTextButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/signUp');
  }
}
