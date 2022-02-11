import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/bloc/post_feed_bloc.dart';
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
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostFeedBloc(),
      child: SerotoninaApp(),
    ),
  );
}
