import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:serotonina/core/error/exceptions.dart';
import 'package:serotonina/core/error/failures.dart';
import 'package:serotonina/features/user_registration/data/datasources/user_datasource.dart';
import 'package:serotonina/features/user_registration/data/models/user_model.dart';
import 'package:serotonina/features/user_registration/data/repositories/user_repositoty_impl.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserDataSource])
void main() {
  UserRepositoryImpl? repository;
  MockUserDataSource? mockUserRemoteDataSource;

  setUp(() {
    mockUserRemoteDataSource = MockUserDataSource();
    repository =
        UserRepositoryImpl(remoteDataSource: mockUserRemoteDataSource!);
  });

  group('submitNewUser', () {
    final tUsername = 'admin';
    final tEmail = 'admin@example.com';
    final tPassword = 'very-strong-password';

    final tUserModel = UserModel(
      id: 'random-uuid',
      username: tUsername,
      email: tEmail,
      roles: [],
    );

    final tUser = tUserModel;

    test('should be able to submit a new user', () async {
      when(mockUserRemoteDataSource!.submitNewUser(
        username: tUsername,
        email: tEmail,
        password: tPassword,
      )).thenAnswer((_) async => tUserModel);

      final result = await repository!.submitNewUser(
          username: tUsername, email: tEmail, password: tPassword);

      verify(
        mockUserRemoteDataSource!.submitNewUser(
          username: tUsername,
          email: tEmail,
          password: tPassword,
        ),
      );

      expect(result, Right(tUser));
    });

    test(
      'should return server error when there was a unexpected error from serve side',
      () async {
        when(mockUserRemoteDataSource!.submitNewUser(
          username: tUsername,
          email: tEmail,
          password: tPassword,
        )).thenThrow(ServerException());

        final result = await repository!.submitNewUser(
            username: tUsername, email: tEmail, password: tPassword);

        verify(mockUserRemoteDataSource!.submitNewUser(
            username: tUsername, email: tEmail, password: tPassword));

        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return user already exist error when we try to registry an already existent user',
      () async {
        when(mockUserRemoteDataSource!.submitNewUser(
          username: tUsername,
          email: tEmail,
          password: tPassword,
        )).thenThrow(UserAlreadyExistsException());

        final result = await repository!.submitNewUser(
            username: tUsername, email: tEmail, password: tPassword);

        verify(mockUserRemoteDataSource!.submitNewUser(
            username: tUsername, email: tEmail, password: tPassword));

        expect(result, Left(UserAlreadyExistsFailure()));
      },
    );
  });
}
