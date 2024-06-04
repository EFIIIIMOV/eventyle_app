import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class AddPostUseCase implements UseCase<void, PostEntity> {
  final PostRepository postRepository;

  AddPostUseCase({required this.postRepository});

  @override
  Future<void> call(PostEntity postEntity) async {
    return await postRepository.addPost(postEntity);
  }
}
