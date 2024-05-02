import 'dart:convert';
import 'dart:io';

import 'package:eventyle_app/features/auth/data/datasources/user_auth_remote_data_source.dart';
import 'package:eventyle_app/features/auth/data/repositories/user_auth_repository_impl.dart';
import 'package:eventyle_app/features/auth/domain/entities/user_register_entity.dart';
import 'package:eventyle_app/features/auth/domain/repositories/user_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../domain/usecases/register_user.dart';

class SignUpUserInfoViewModel extends ChangeNotifier {
  final RegisterUserUseCase registerUserUseCase = RegisterUserUseCase(
    userAuthRepository: UserAuthRepositoryImpl(
      userAuthRemoteDataSource: UserAuthRemoteDataSourceImpl(),
    ),
  );

  SignUpUserInfoViewModel();

  File? profileSelectedImage = null;
  String base64Image = '';
  String? profileSpecialization = 'Укажите специальность';
  String user_id = '';

  List<String> profileSpecializations = <String>[
    'Укажите специальность',
    'Первый вариант',
    'Второй вариант',
    'Третий вариант',
  ];

  void updateImageField() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    profileSelectedImage = File(returnedImage!.path);
    notifyListeners();
  }

  void updateProfileSpecialization(String? selectedSpecialization) {
    profileSpecialization = selectedSpecialization;
    notifyListeners();
  }

  // void updateProfileSpecialization(String selectedSpecialization) async {
  //   profileSpecialization = selectedSpecialization;
  //   notifyListeners();
  // }

  void onRegNewUserButtonPressed({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String surname,
    required String aboutUser,
  }) async {
    user_id = Uuid().v4().replaceAll('-', '');
    if (profileSelectedImage != null) {
      base64Image = base64Encode(await profileSelectedImage!.readAsBytes());
    }
    final UserRegisterEntity userRegisterEntity = UserRegisterEntity(
      user_id: user_id,
      email: email,
      password: password,
      image: base64Image ?? '',
      role: profileSpecialization!,
      name: name,
      surname: surname,
      aboutUser: aboutUser,
    );
    await registerUserUseCase.call(userRegisterEntity);
    Navigator.pushNamedAndRemoveUntil(
        context, '/', (Route<dynamic> route) => false);
  }
}
