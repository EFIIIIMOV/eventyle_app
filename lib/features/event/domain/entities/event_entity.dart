import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final String name;
  final String date;
  final String place;
  final String description;

  const EventEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.place,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        date,
        place,
        description,
      ];
}
