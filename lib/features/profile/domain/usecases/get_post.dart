import 'package:eventyle_app/core/usecases/usecase.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';
import 'package:eventyle_app/features/profile/domain/repositories/profile_info_repository.dart';
import '../entities/post_entity.dart';
import '../entities/profile_info_entity.dart';
import '../repositories/post_repository.dart';
import '../repositories/profile_info_repository.dart';

class GetPostUseCase implements UseCase<List<PostEntity>, String> {
  final PostRepository postRepository;

  GetPostUseCase({required this.postRepository});

  @override
  Future<List<PostEntity>> call(String user_id) async {
    return await postRepository.getAllPosts(user_id);
  }
}
