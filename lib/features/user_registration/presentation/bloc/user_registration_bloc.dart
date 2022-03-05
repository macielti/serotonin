import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serotonina/features/user_registration/domain/usercases/submit_new_user.dart';

class UserRegistrationBloc extends ChangeNotifier {
  UserRegistrationBloc(this.submitNewUserUsecase);

  bool isLoading = false;
  SubmitNewUser submitNewUserUsecase;

  void submitNewUser({
    required String username,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    final params = Params(username: username, email: email, password: password);
    await submitNewUserUsecase(params);
    isLoading = false;
    notifyListeners();
  }
}
