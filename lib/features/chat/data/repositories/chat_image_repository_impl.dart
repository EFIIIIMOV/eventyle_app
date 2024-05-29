import '../../domain/entities/chat_image_entity.dart';
import '../../domain/interfaces/chat_image_repository.dart';
import '../datasources/chat_image_remote_data_source.dart';
import '../models/chat_image_model.dart';

class ChatImageRepositoryImpl implements ChatImageRepository {
  final ChatImageRemoteDataSource chatImageRemoteDataSource;

  ChatImageRepositoryImpl({required this.chatImageRemoteDataSource});

  @override
  Future<void> addChatImage(ChatImageEntity chatImageEntity) async {
    final ChatImageModel chatImageModel = ChatImageModel(
      image_id: chatImageEntity.image_id,
      image: chatImageEntity.image,
    );
    await chatImageRemoteDataSource.addImageChat(chatImageModel);
    return Future.value();
  }
}
