import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/chat_entity.dart';
import '../entities/chat_message_entity.dart';
import '../interfaces/chat_message_repository.dart';

class AddChatMessageUseCase implements UseCase<void, ChatMessageEntity> {
  final ChatMessageRepository chatMessageRepository;

  AddChatMessageUseCase({required this.chatMessageRepository});

  @override
  Future<void> call(ChatMessageEntity chatMessageEntity) async {
    return await chatMessageRepository.addChatMessage(chatMessageEntity);
  }
}
