import 'dart:convert';

import 'package:serotonina/models/user_registration.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://192.168.3.161:8010';

class PorteiroClient {
  Future<http.Response> submitNewUser(UserRegistration userRegistration) async {
    await Future.delayed(Duration(seconds: 3));
    final url = Uri.parse('$_baseUrl/users');
    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': userRegistration.username,
          'email': userRegistration.email,
          'password': userRegistration.password
        },
      ),
    );
  }
}
