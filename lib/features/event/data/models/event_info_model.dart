import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';

import '../../domain/entities/event_info_entity.dart';

class EventInfoModel extends EventInfoEntity {
  const EventInfoModel({
    required super.info_id,
    required super.event_id,
    required super.name,
    required super.description,
  });

  factory EventInfoModel.fromJson(Map<String, dynamic> json) {
    return EventInfoModel(
      info_id: json['info_id'] ?? '',
      event_id: json['event_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info_id': info_id,
      'event_id': event_id,
      'name': name,
      'description': description,
    };
  }
}
