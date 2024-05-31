import '../../domain/entities/chat_message_entity.dart';

class ChatMessageModel extends ChatMessageEntity {
  const ChatMessageModel({
    required super.message_id,
    required super.chat_id,
    required super.user_id,
    required super.messageText,
    required super.date,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      message_id: json['message_id'] ?? '',
      chat_id: json['chat_id'] ?? '',
      user_id: json['user_id'] ?? '',
      messageText: json['message_text'] ?? '',
      date: DateTime.parse(json['create_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': message_id,
      'chat_id': chat_id,
      'user_id': user_id,
      'messageText': messageText,
      'date': date,
    };
  }
}
