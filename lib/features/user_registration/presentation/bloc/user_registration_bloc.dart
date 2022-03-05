import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serotonina/features/user_registration/domain/usercases/submit_new_user.dart';

class UserRegistrationBloc extends ChangeNotifier {
  UserRegistrationBloc(this.submitNewUserUsecase);

  SubmitNewUser submitNewUserUsecase;

  UserRegistrationState _state = Empty();

  set state(UserRegistrationState state) {
    _state = state;
    notifyListeners();
  }

  UserRegistrationState get state => _state;

  void submitNewUser({
    required String username,
    required String email,
    required String password,
  }) async {
    state = Loading();
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    final params = Params(username: username, email: email, password: password);
    final userRegistrationEither = await submitNewUserUsecase(params);

    userRegistrationEither.fold(
      (failure) {
        state = Error('Error test');
        notifyListeners();
      },
      (user) {
        state = Loaded();
        notifyListeners();
      },
    );
  }
}

@immutable
abstract class UserRegistrationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends UserRegistrationState {}

class Loading extends UserRegistrationState {}

class Loaded extends UserRegistrationState {}

class Error extends UserRegistrationState {
  Error(this.message);

  final String message;
}
