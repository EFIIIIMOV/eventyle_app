import '../entities/chat_user_entity.dart';

abstract class ChatUserRepository {
  Future<List<ChatUserEntity>> getAllUsers(String searchQuery);

  Future<void> addUserToChat(Map<String, Object> usersList);
}
