import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/component/button_loading_indicator.dart';
import 'package:serotonina/features/user_registration/presentation/bloc/user_registration_bloc.dart';

class UserRegistration extends StatelessWidget {
  UserRegistration({required this.onSuccess, required this.onError});

  final formKey = GlobalKey<FormState>();
  late String username, email, password;

  final VoidCallback onSuccess;
  final VoidCallback onError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    hintText: 'Nome de usuário',
                  ),
                  validator: _validateUsername,
                  onSaved: (value) {
                    username = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'exemplo@exemplo.com',
                  ),
                  validator: _validateEmail,
                  onSaved: (value) {
                    email = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: '*******',
                  ),
                  validator: _validatePassword,
                  onSaved: (value) {
                    password = value!;
                  },
                ),
              ),
              Consumer<UserRegistrationBloc>(
                builder: (context, userRegistrationBloc, child) {
                  _handleBlocState(userRegistrationBloc);
                  return ButtonLoadingIndicator(
                    loading: userRegistrationBloc.state is Loading,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        userRegistrationBloc.submitNewUser(
                          username: username,
                          email: email,
                          password: password,
                        );
                      }
                    },
                    child: Text('Criar Conta'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBlocState(UserRegistrationBloc userRegistrationBloc) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        switch (userRegistrationBloc.state.runtimeType) {
          case Error:
            onError();
            break;
          case Loaded:
            onSuccess();
        }
      },
    );
  }

  String? _validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    } else {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Este campo não pode ficar vazio';
    } else {
      return null;
    }
  }
}
