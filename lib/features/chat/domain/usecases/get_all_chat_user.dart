import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/chat_entity.dart';
import '../entities/chat_user_entity.dart';
import '../interfaces/chat_repository.dart';
import '../interfaces/chat_user_repository.dart';

class GetAllChatUserUseCase implements UseCase<List<ChatUserEntity>, String> {
  final ChatUserRepository chatUserRepository;

  GetAllChatUserUseCase({required this.chatUserRepository});

  @override
  Future<List<ChatUserEntity>> call(String chat_id) async {
    return await chatUserRepository.getChatUsers(chat_id);
  }
}
