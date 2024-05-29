import '../entities/chat_image_entity.dart';

abstract class ChatImageRepository {
  Future<void> addChatImage(ChatImageEntity chatImageEntity);
}
