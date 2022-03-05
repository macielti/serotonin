import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nuvigator/next.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/features/user_registration/presentation/bloc/user_registration_bloc.dart';
import 'package:serotonina/features/user_registration/presentation/pages/user_registration.dart';

class UserRegistrationRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object> settings) {
    final nuvigator = Nuvigator.of(context);
    final userRegistrationBloc = Provider.of<UserRegistrationBloc>(
      context,
      listen: false,
    );

    return UserRegistration(
      onError: () {
        nuvigator.pushNamed('error');
        userRegistrationBloc.state = Empty();
      },
      onSuccess: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Novo usuário criado ✅'),
          ),
        );
        userRegistrationBloc.state = Empty();
      },
    );
  }

  @override
  String get path => 'user-registration';

  @override
  ScreenType get screenType => materialScreenType;
}
