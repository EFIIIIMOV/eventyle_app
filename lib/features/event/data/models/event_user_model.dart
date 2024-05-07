import 'package:eventyle_app/features/event/domain/entities/event_user_entity.dart';

class EventUserModel extends EventUserEntity {
  EventUserModel({
    required super.user_id,
    required super.role,
    required super.name,
    required super.surname,
    required super.description,
  });

  factory EventUserModel.fromJson(Map<String, dynamic> json) {
    return EventUserModel(
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
