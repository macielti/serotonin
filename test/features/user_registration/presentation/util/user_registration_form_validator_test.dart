import 'package:flutter_test/flutter_test.dart';
import 'package:serotonina/features/user_registration/presentation/util/user_registration_form_validator.dart';

void main() {
  UserRegistrationFormValidator? formValidator;

  setUp(() {
    formValidator = UserRegistrationFormValidator();
  });

  group('usernameValidator', () {
    test(
      'should return a message when the user left the value empty',
      () async {
        final result = formValidator!.usernameValidator('');
        expect(result, 'Este campo não pode ficar vazio');
      },
    );
    test('should return null when the method receives as valid username',
        () async {
      final result = formValidator!.usernameValidator('admin');
      expect(result, isNull);
    });
  });

  group('emailValidator', () {
    test(
      'should return a message when the method receives a empty (invalid) email',
      () async {
        final result = formValidator!.emailValidator('');
        expect(result, 'Este campo não pode ficar vazio');
      },
    );
    test('should return null when the method receives as valid email',
        () async {
      final result = formValidator!.usernameValidator('admin@example.com');
      expect(result, isNull);
    });
  });

  group('passwordValidator', () {
    test(
      'should return a message when the method receives a empty (invalid) password',
      () async {
        final result = formValidator!.emailValidator('');
        expect(result, 'Este campo não pode ficar vazio');
      },
    );
    test('should return null when the method receives as valid password',
        () async {
      final result = formValidator!.usernameValidator('very-strong-password');
      expect(result, isNull);
    });
  });
}
