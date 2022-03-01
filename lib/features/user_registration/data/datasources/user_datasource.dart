import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serotonina/core/error/exceptions.dart';
import 'package:serotonina/features/user_registration/data/models/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> submitNewUser({
    required String username,
    required String email,
    required String password,
  });
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl({required this.httpClient});

  final http.Client httpClient;

  @override
  Future<UserModel> submitNewUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await httpClient.post(
        Uri.parse('http://localhost:8010/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password
        }));

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 409) {
      throw UserAlreadyExistsException();
    } else {
      throw ServerException();
    }
  }
}
