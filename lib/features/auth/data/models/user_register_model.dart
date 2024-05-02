import 'package:eventyle_app/features/auth/domain/entities/user_register_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  const UserRegisterModel({
    required super.user_id,
    required super.email,
    required super.password,
    required super.image,
    required super.role,
    required super.name,
    required super.surname,
    required super.aboutUser,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      user_id: json['user_id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      image: json['image'] ?? '',
      role: json['role'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      aboutUser: json['aboutUser'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'email': email,
      'password': password,
      'image': image,
      'role': role,
      'name': name,
      'surname': surname,
      'aboutUser': aboutUser,
    };
  }
}
