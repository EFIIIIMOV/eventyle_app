import '../entities/chat_message_entity.dart';

abstract class ChatMessageRepository {
  Future<List<ChatMessageEntity>> getAllChatMessages(String chat_id);

  Future<void> addChatMessage(ChatMessageEntity chatMessageEntity);
}
