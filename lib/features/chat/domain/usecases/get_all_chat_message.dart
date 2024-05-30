import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/chat_message_entity.dart';
import '../interfaces/chat_message_repository.dart';

class GetAllChatMessageUseCase
    implements UseCase<List<ChatMessageEntity>, String> {
  final ChatMessageRepository chatMessageRepository;

  GetAllChatMessageUseCase({required this.chatMessageRepository});

  @override
  Future<List<ChatMessageEntity>> call(String chat_id) async {
    return await chatMessageRepository.getAllChatMessages(chat_id);
  }
}
