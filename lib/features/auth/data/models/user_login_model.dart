import 'package:eventyle_app/features/auth/domain/entities/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  UserLoginModel({
    required super.email,
    required super.password,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
