import '../../domain/entities/post_image_entity.dart';

class PostImageModel extends PostImageEntity {
  const PostImageModel({
    required super.image_id,
    required super.image,
  });

  factory PostImageModel.fromJson(Map<String, dynamic> json) {
    return PostImageModel(
      image_id: json['image_id'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_id': image_id,
      'image': image,
    };
  }
}
