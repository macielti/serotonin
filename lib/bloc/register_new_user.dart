import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:serotonina/client/porteiro_client.dart';
import 'package:serotonina/models/user_registration.dart';

class RegisterNewUserBloc extends ChangeNotifier {
  late bool loading = false;

  Future<Response> submitNewUser(UserRegistration userRegistration) async {
    loading = true;
    notifyListeners();
    final response = await PorteiroClient().submitNewUser(userRegistration);
    loading = false;
    notifyListeners();
    return response;
  }
}
