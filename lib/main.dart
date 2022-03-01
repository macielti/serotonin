import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/bloc/post_feed.dart';
import 'package:serotonina/bloc/register_new_user.dart';
import 'package:serotonina/screens/register_new_user.dart';

class SerotoninaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterNewUser(),
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostFeedBloc()),
        ChangeNotifierProvider(create: (context) => BottomBarBloc()),
        ChangeNotifierProvider(create: (context) => RegisterNewUserBloc()),
      ],
      child: SerotoninaApp(),
    ),
  );
}
