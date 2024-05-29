import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/chat_entity.dart';
import '../interfaces/chat_repository.dart';

class GetAllChatUseCase implements UseCase<List<ChatEntity>, void> {
  final ChatRepository chatRepository;

  GetAllChatUseCase({required this.chatRepository});

  @override
  Future<List<ChatEntity>> call(void params) async {
    return await chatRepository.getAllChats();
  }
}
