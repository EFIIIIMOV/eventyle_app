import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';

import '../../domain/entities/event_info_entity.dart';

class EventInfoModel extends EventInfoEntity {
  const EventInfoModel({
    required super.id,
    required super.name,
    required super.description,
  });

  factory EventInfoModel.fromJson(Map<String, dynamic> json) {
    return EventInfoModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
