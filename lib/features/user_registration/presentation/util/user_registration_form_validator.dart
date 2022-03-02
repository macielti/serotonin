class UserRegistrationFormValidator {
  String? usernameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    }
    return null;
  }
}
