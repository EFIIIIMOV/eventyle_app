import 'package:eventyle_app/features/profile/data/models/post_image_model.dart';

import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.post_id,
    required super.postText,
    required super.imageIds,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        post_id: json['post_id'] ?? '',
        postText: json['post_text'] ?? '',
        imageIds: List<String>.from(json['images'].map((x) => x.toString())));
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id': post_id,
      'postText': postText,
      'imageIds': imageIds,
    };
  }
}
