import 'package:eventyle_app/features/chat/domain/entities/chat_entity.dart';
import '../../domain/interfaces/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({required this.chatRemoteDataSource});

  @override
  Future<void> addChat(ChatEntity chatEntity) async {
    final ChatModel chatModel = ChatModel(
        chat_id: chatEntity.chat_id,
        name: chatEntity.name,
        description: chatEntity.description);
    await chatRemoteDataSource.addChat(chatModel);
    return Future.value();
  }

  @override
  Future<List<ChatEntity>> getAllChats() async {
    final chatModels = await chatRemoteDataSource.getAllChats();
    List<ChatEntity> chatEntities =
        chatModels.map((chatModel) => chatModel as ChatEntity).toList();
    return chatEntities;
  }
}
