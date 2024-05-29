import '../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.chat_id,
    required super.name,
    required super.description,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chat_id: json['chat_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_id': chat_id,
      'name': name,
      'description': description,
    };
  }
}
