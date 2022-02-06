import 'package:flutter/material.dart';
import 'package:serotonina/screens/feed.dart';

class SerotoninaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostFeed(),
    );
  }
}

void main() {
  runApp(SerotoninaApp());
}
