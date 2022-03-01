import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:serotonina/features/user_registration/data/models/user_model.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(
    id: 'random-uuid',
    username: 'admin',
    roles: ['ADMIN'],
    email: 'admin@example.com',
  );

  test('shuld be a subclass of User entity', () async {
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test(
        'should return a valid user model on success response to user registration',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('user_registration_porteiro_success.json'),
      );

      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
  });
}
