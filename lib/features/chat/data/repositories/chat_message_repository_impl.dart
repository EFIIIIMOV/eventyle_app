import 'package:eventyle_app/features/chat/domain/entities/chat_entity.dart';
import 'package:eventyle_app/features/chat/domain/entities/chat_message_entity.dart';
import '../../domain/interfaces/chat_message_repository.dart';
import '../../domain/interfaces/chat_repository.dart';
import '../datasources/chat_message_remote_data_source.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_message_model.dart';
import '../models/chat_model.dart';

class ChatMessageRepositoryImpl implements ChatMessageRepository {
  final ChatMessageRemoteDataSource chatMessageRemoteDataSource;

  ChatMessageRepositoryImpl({required this.chatMessageRemoteDataSource});

  @override
  Future<List<ChatMessageEntity>> getAllChatMessages(String chat_id) async {
    final chatMessageModels =
        await chatMessageRemoteDataSource.getAllChatMessages(chat_id);
    List<ChatMessageEntity> chatMessageEntities = chatMessageModels
        .map((chatMessageModel) => chatMessageModel as ChatMessageEntity)
        .toList();
    return chatMessageEntities;
  }

  @override
  Future<void> addChatMessage(ChatMessageEntity chatMessageEntity) async {
    final ChatMessageModel chatMessageModel = ChatMessageModel(
      message_id: chatMessageEntity.message_id,
      chat_id: chatMessageEntity.chat_id,
      user_id: chatMessageEntity.user_id,
      messageText: chatMessageEntity.messageText,
      date: chatMessageEntity.date,
    );
    await chatMessageRemoteDataSource.addChatMessage(chatMessageModel);
    return Future.value();
  }
}
