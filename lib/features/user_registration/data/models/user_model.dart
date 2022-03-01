import 'package:serotonina/features/user_registration/domain/entities/User.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String username,
    required List<String> roles,
    required String email,
  }) : super(id: id, username: username, roles: roles, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return UserModel(
      id: userJson['id'],
      username: userJson['username'],
      roles: userJson['roles'].cast<String>(),
      email: userJson['email'],
    );
  }
}
