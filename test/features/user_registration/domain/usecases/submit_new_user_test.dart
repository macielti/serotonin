import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';
import 'package:serotonina/features/user_registration/domain/repositories/user_repository.dart';
import 'package:serotonina/features/user_registration/domain/usercases/submit_new_user.dart';

import 'submit_new_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  SubmitNewUser? usecase;
  MockUserRepository? mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = SubmitNewUser(mockUserRepository!);
  });

  final tUsername = 'admin';
  final tEmail = 'admin@example.com';
  final tPassword = 'very-strong-password';

  final tUser = User(
    id: 'random-uuid',
    username: tUsername,
    email: tEmail,
    roles: [],
  );

  test('should be able to submit a new user', () async {
    when(mockUserRepository!.submitNewUser(
      username: tUsername,
      email: tEmail,
      password: tPassword,
    )).thenAnswer((_) async => Right(tUser));

    final result = await usecase!(
        Params(username: tUsername, email: tEmail, password: tPassword));

    verify(mockUserRepository!.submitNewUser(
        username: tUsername, email: tEmail, password: tPassword));
    expect(result, Right(tUser));
  });
}
