import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/profile/domain/entities/profile_info_entity.dart';

class ProfileInfoModel extends ProfileInfoEntity {
  const ProfileInfoModel({
    required super.user_id,
    required super.role,
    required super.name,
    required super.surname,
    required super.description,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
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
