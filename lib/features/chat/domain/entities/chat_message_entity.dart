import 'package:equatable/equatable.dart';

class ChatMessageEntity extends Equatable {
  final String message_id;
  final String chat_id;
  final String user_id;
  final String messageText;
  final DateTime date;

  const ChatMessageEntity({
    required this.message_id,
    required this.chat_id,
    required this.user_id,
    required this.messageText,
    required this.date,
  });

  @override
  List<Object?> get props => [
        message_id,
        chat_id,
        user_id,
        messageText,
        date,
      ];
}
