import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String event_id;
  final String name;
  final DateTime date;
  final String place;
  final String description;

  const EventEntity({
    required this.event_id,
    required this.name,
    required this.date,
    required this.place,
    required this.description,
  });

  @override
  List<Object?> get props => [
        event_id,
        name,
        date,
        place,
        description,
      ];
}
