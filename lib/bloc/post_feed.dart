import 'package:flutter/cupertino.dart';
import 'package:serotonina/client/dolinho_client.dart';
import 'package:serotonina/models/curatorship_stats.dart';
import 'package:serotonina/models/post.dart';

class PostFeedBloc extends ChangeNotifier {
  PostFeedBloc() {
    fetchPosts();
  }

  late bool loading = true;
  late List<Post> posts = [];

  void fetchPosts() async {
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));
    posts = await DolinhoClient().fetchPostsReadyForCuratorship();
    loading = false;
    notifyListeners();
  }

  void removePost(Post post) {
    posts.remove(post);
    notifyListeners();
  }
}

class BottomBarBloc extends ChangeNotifier {
  BottomBarBloc() {
    fetchCuratorshipStats();
  }

  late bool loading = true;
  late CuratorshipStats curatorshipStats;

  void fetchCuratorshipStats() async {
    loading = true;
    notifyListeners();
    curatorshipStats = await DolinhoClient().fetchCuratorshipStats();
    loading = false;
    notifyListeners();
  }
}
