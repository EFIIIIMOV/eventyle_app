import 'package:eventyle_app/features/found_users/domain/entities/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    required super.user_id,
    required super.role,
    required super.name,
    required super.surname,
    required super.description,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      user_id: json['user_id'] ?? '',
      role: json['role'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'role': role,
      'name': name,
      'surname': surname,
      'description': description,
    };
  }
}
