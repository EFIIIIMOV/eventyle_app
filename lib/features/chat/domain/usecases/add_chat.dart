import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/chat_entity.dart';
import '../interfaces/chat_repository.dart';

class AddChatUseCase implements UseCase<void, ChatEntity> {
  final ChatRepository chatRepository;

  AddChatUseCase({required this.chatRepository});

  @override
  Future<void> call(ChatEntity chatEntity) async {
    return await chatRepository.addChat(chatEntity);
  }
}
