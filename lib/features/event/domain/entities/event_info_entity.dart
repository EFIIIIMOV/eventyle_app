import 'package:equatable/equatable.dart';

class EventInfoEntity extends Equatable {
  final int id;
  final String name;
  final String description;

  const EventInfoEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
  ];
}
