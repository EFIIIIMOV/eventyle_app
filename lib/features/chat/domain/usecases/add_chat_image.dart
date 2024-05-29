import '../../../../core/usecases/usecase.dart';
import '../entities/chat_image_entity.dart';
import '../interfaces/chat_image_repository.dart';

class AddChatImageUseCase implements UseCase<void, ChatImageEntity> {
  final ChatImageRepository chatImageRepository;

  AddChatImageUseCase({required this.chatImageRepository});

  @override
  Future<void> call(ChatImageEntity chatImageEntity) async {
    return await chatImageRepository.addChatImage(chatImageEntity);
  }
}
