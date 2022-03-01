import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/bloc/register_new_user.dart';
import 'package:serotonina/component/button_loading_indicator.dart';
import 'package:serotonina/models/user_registration.dart';

class RegisterNewUser extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  late String username, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Conta')),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Este campo não pode ficar vazio';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Este campo não pode ficar vazio';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Este campo não pode ficar vazio';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                ),
              ),
              Consumer<RegisterNewUserBloc>(
                builder: (context, registerNewUserBloc, child) {
                  return ButtonLoadingIndicator(
                    loading: registerNewUserBloc.loading,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await registerNewUserBloc.submitNewUser(
                          UserRegistration(
                              username: username,
                              email: email,
                              password: password),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Novo usuário criado ✅'),
                          ),
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
}
