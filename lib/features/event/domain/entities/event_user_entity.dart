class EventUserEntity {
  final String user_id;
  final String role;
  final String name;
  final String surname;
  final String description;
  bool isSelected;

  EventUserEntity({
    required this.user_id,
    required this.role,
    required this.name,
    required this.surname,
    required this.description,
    required this.isSelected,
  });
}
