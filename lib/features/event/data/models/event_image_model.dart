import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/entities/event_image_entity.dart';

class EventImageModel extends EventImageEntity {
  const EventImageModel({
    required super.image_id,
    required super.image,
  });

  factory EventImageModel.fromJson(Map<String, dynamic> json) {
    return EventImageModel(
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
