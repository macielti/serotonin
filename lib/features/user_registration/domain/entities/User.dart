import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    required this.username,
    required this.id,
    required this.roles,
    required this.email,
  });

  final String username;
  final String id;
  final List<String> roles;
  final String email;

  @override
  List<Object?> get props => [username, id, roles, email];
}
