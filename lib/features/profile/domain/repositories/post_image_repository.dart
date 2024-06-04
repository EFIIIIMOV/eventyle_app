import 'package:eventyle_app/features/profile/domain/entities/post_image_entity.dart';

abstract class PostImageRepository {
  Future<void> addPostImage(List<PostImageEntity> postImageEntityList);
}
