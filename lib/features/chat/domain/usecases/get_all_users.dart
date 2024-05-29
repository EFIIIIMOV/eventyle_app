import 'package:eventyle_app/core/usecases/usecase.dart';

import '../entities/chat_user_entity.dart';
import '../interfaces/chat_user_repository.dart';

class GetAllUsersUseCase implements UseCase<List<ChatUserEntity>, String> {
  final ChatUserRepository chatUserRepository;

  GetAllUsersUseCase({required this.chatUserRepository});

  @override
  Future<List<ChatUserEntity>> call(String searchQuery) async {
    return await chatUserRepository.getAllUsers(searchQuery);
  }
}
