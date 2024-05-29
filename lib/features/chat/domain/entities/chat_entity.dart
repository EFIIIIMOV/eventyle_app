import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String chat_id;
  final String name;
  final String description;

  const ChatEntity({
    required this.chat_id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        chat_id,
        name,
        description,
      ];
}
