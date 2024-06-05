import 'package:equatable/equatable.dart';
class PostEntity extends Equatable {
  final String post_id;
  final String postText;
  final List<String>? imageIds;

  const PostEntity({
    required this.post_id,
    required this.postText,
    required this.imageIds,
  });

  @override
  List<Object?> get props => [
        post_id,
        postText,
    imageIds,
      ];
}
