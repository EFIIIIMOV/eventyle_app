import 'package:equatable/equatable.dart';

class EventInfoEntity extends Equatable {
  final String info_id;
  final String event_id;
  final String name;
  final String description;

  const EventInfoEntity({
    required this.info_id,
    required this.event_id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        info_id,
        event_id,
        name,
        description,
      ];
}
