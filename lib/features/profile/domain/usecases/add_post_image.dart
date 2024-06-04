import 'package:eventyle_app/features/profile/domain/entities/post_image_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_image_repository.dart';
import '../repositories/post_repository.dart';

class AddPostImageUseCase implements UseCase<void, List<PostImageEntity>> {
  final PostImageRepository postImageRepository;

  AddPostImageUseCase({required this.postImageRepository});

  @override
  Future<void> call(List<PostImageEntity> postImageEntityList) async {
    return await postImageRepository.addPostImage(postImageEntityList);
  }
}
