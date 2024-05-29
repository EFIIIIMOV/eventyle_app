import '../entities/chat_entity.dart';

abstract class ChatRepository {
  Future<List<ChatEntity>> getAllChats();

  Future<void> addChat(ChatEntity chatEntity);
}
