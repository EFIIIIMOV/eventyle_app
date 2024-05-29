import '../../../../core/usecases/usecase.dart';
import '../interfaces/chat_user_repository.dart';

class AddUserToChatUseCase implements UseCase<void, Map<String, Object>> {
  final ChatUserRepository chatUserRepository;

  AddUserToChatUseCase({required this.chatUserRepository});

  @override
  Future<void> call(Map<String, Object> usersList) async {
    return await chatUserRepository.addUserToChat(usersList);
  }
}
