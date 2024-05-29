import '../../domain/entities/chat_user_entity.dart';

class ChatUserModel extends ChatUserEntity {
  ChatUserModel({
    required super.user_id,
    required super.role,
    required super.name,
    required super.surname,
    required super.description,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
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
