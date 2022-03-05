import 'package:flutter/material.dart';
import 'package:serotonina/injection_container.dart' as di;
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
  di.init();
  runApp(SerotoninaApp());
}
