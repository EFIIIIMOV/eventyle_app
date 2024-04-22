import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.event_id,
    required super.name,
    required super.date,
    required super.place,
    required super.description,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      event_id: json['event_id'] ?? '',
      name: json['name'] ?? '',
      date: DateTime.parse(json['date']),
      place: json['place'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': event_id,
      'name': name,
      'date': date,
      'place': place,
      'description': description,
    };
  }
}
