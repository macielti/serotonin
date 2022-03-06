import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';
import 'package:serotonina/features/user_registration/domain/usercases/submit_new_user.dart';
import 'package:serotonina/features/user_registration/presentation/bloc/user_registration_bloc.dart';

import 'user_registration_bloc_test.mocks.dart';

@GenerateMocks([SubmitNewUser])
void main() {
  MockSubmitNewUser? mockSubmitNewUserUsecase;
  UserRegistrationBloc? bloc;

  setUp(() {
    mockSubmitNewUserUsecase = MockSubmitNewUser();
    bloc = UserRegistrationBloc(mockSubmitNewUserUsecase!);
  });

  group('initial state', () {
    test(
      'when the bloc is instantiated it should be in a empty state',
      () async {
        expect(bloc!.state, Empty());
      },
    );
  });

  group('submitNewUser', () {
    final tUsername = 'admin';
    final tEmail = 'admin@example.com';
    final tPassword = 'very-strong-password';

    final user =
        User(id: 'random-uuid', username: tUsername, roles: [], email: tEmail);

    test(
      'when we the user submit a new user the bloc should act on top of that event',
      () async {
        when(mockSubmitNewUserUsecase!(any))
            .thenAnswer((realInvocation) async => Right(user));

        bloc!.submitNewUser(
            email: tEmail, password: tPassword, username: tUsername);

        await untilCalled(mockSubmitNewUserUsecase!(any));

        verify(mockSubmitNewUserUsecase!(Params(
          username: tUsername,
          password: tPassword,
          email: tEmail,
        )));
      },
    );
  });
}
