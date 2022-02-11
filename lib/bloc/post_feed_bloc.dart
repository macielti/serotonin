import 'package:flutter/cupertino.dart';
import 'package:serotonina/client/dolinho_client.dart';
import 'package:serotonina/models/post.dart';

class PostFeedBloc extends ChangeNotifier {
  PostFeedBloc() {
    fetchPosts();
  }

  late bool loading = true;
  late List<Post> posts = [];

  void fetchPosts() async {
    posts = await DolinhoClient().fetchNotCuratedPosts();
    loading = false;
    notifyListeners();
  }
}
