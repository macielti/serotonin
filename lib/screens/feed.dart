import 'package:flutter/material.dart';
import 'package:serotonina/client/dolinho_client.dart';
import 'package:serotonina/component/loading_indicator.dart';
import 'package:serotonina/component/player.dart';
import 'package:serotonina/models/post.dart';
import 'package:video_player/video_player.dart';

const _titleAppBar = 'Posts';

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: FutureBuilder<List<Post>>(
        future: DolinhoClient().fetchPosts(),
        builder: (context, posts) {
          if (posts.connectionState != ConnectionState.done) {
            return LoadingIndicator();
          } else {
            return ListView.builder(
              itemCount: posts.data!.length,
              itemBuilder: (context, index) =>
                  PostItem(post: posts.data![index]),
            );
          }
        },
      ),
    );
  }
}

class PostFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostFeedState();
  }
}

class PostItem extends StatelessWidget {
  const PostItem({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Dismissible(
        key: Key(post.toString()),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            DolinhoClient().curatePost(post, true);
          } else if (direction == DismissDirection.endToStart) {
            DolinhoClient().curatePost(post, false);
          }
        },
        background: Container(color: Colors.green),
        secondaryBackground: Container(color: Colors.red),
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text(post.title),
              ),
              Container(
                height: 425,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Player(
                    videoPlayerController:
                        VideoPlayerController.network(post.assetUrl),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
