import 'package:equatable/equatable.dart';

class EventUserEntity extends Equatable {
  final String user_id;
  final String role;
  final String name;
  final String surname;
  final String description;

  EventUserEntity({
    required this.user_id,
    required this.role,
    required this.name,
    required this.surname,
    required this.description,
  });

  @override
  List<Object?> get props => [
        user_id,
        role,
        name,
        surname,
        description,
      ];
}
