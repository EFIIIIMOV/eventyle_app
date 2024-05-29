

import '../../domain/entities/chat_user_entity.dart';
import '../../domain/interfaces/chat_user_repository.dart';
import '../datasources/chat_user_remote_data_source.dart';

class ChatUserRepositoryImpl implements ChatUserRepository {
  final ChatUserRemoteDataSource chatUserRemoteDataSource;

  ChatUserRepositoryImpl({required this.chatUserRemoteDataSource});

  @override
  Future<List<ChatUserEntity>> getAllUsers(String searchQuery) async {
    final chatUserModels =
        await chatUserRemoteDataSource.getAllUsers(searchQuery);
    List<ChatUserEntity> userInfoEntities = chatUserModels
        .map((userInfoModels) => userInfoModels as ChatUserEntity)
        .toList();
    return userInfoEntities;
  }

  @override
  Future<void> addUserToChat(Map<String, Object> usersList) async {
    await chatUserRemoteDataSource.addUserToChat(usersList);
  }
}
