import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/features/user_registration/presentation/bloc/user_registration_bloc.dart';
import 'package:serotonina/features/user_registration/presentation/router.dart';
import 'package:serotonina/injection_container.dart' as di;
import 'package:serotonina/injection_container.dart';

class SerotoninaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nuvigator(
        router: UserRegistrationRouter(),
      ),
    );
  }
}

void main() {
  di.init();
  runApp(ChangeNotifierProvider(
    create: (_) => sl<UserRegistrationBloc>(),
    child: SerotoninaApp(),
  ));
}
