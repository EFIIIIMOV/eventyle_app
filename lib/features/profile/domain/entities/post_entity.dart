import 'package:equatable/equatable.dart';
import 'package:eventyle_app/features/profile/domain/entities/post_image_entity.dart';

class PostEntity extends Equatable {
  final String post_id;
  final String postText;
  final List<PostImageEntity>? images;

  const PostEntity({
    required this.post_id,
    required this.postText,
    required this.images,
  });

  @override
  List<Object?> get props => [
        post_id,
        postText,
        images,
      ];
}
