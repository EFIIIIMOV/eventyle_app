import '../../../../core/usecases/usecase.dart';
import '../interfaces/chat_user_repository.dart';

class AddChatToEventUseCase implements UseCase<void, Map<String, Object>> {
  final ChatUserRepository chatUserRepository;

  AddChatToEventUseCase({required this.chatUserRepository});

  @override
  Future<void> call(Map<String, Object> usersList) async {
    return await chatUserRepository.addUserToChat(usersList);
  }
}
