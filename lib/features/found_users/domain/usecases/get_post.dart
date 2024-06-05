import 'package:eventyle_app/core/usecases/usecase.dart';
import '../entities/user_post_entity.dart';
import '../repositories/post_repository.dart';

class GetPostUseCase implements UseCase<List<PostEntity>, String> {
  final PostRepository postRepository;

  GetPostUseCase({required this.postRepository});

  @override
  Future<List<PostEntity>> call(String user_id) async {
    return await postRepository.getAllPosts(user_id);
  }
}
