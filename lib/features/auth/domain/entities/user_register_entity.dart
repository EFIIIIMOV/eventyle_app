import 'package:equatable/equatable.dart';

class UserRegisterEntity extends Equatable {
  final String user_id;
  final String email;
  final String password;
  final String image;
  final String role;
  final String name;
  final String surname;
  final String aboutUser;

  const UserRegisterEntity({
    required this.user_id,
    required this.email,
    required this.password,
    required this.image,
    required this.role,
    required this.name,
    required this.surname,
    required this.aboutUser,
  });

  @override
  List<Object?> get props => [
        user_id,
        email,
        password,
        image,
        role,
        name,
        surname,
        aboutUser,
      ];
}
