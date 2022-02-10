import 'package:flutter/material.dart';
import 'package:serotonina/client/dolinho_client.dart';
import 'package:serotonina/component/loading_indicator.dart';
import 'package:serotonina/component/player.dart';
import 'package:serotonina/models/post.dart';
import 'package:video_player/video_player.dart';

const _titleAppBar = 'Posts';

class PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: FutureBuilder<List<Post>?>(
        future: DolinhoClient().fetchPosts(),
        builder: (context, posts) {
          if (posts.connectionState != ConnectionState.done) {
            return LoadingIndicator();
          } else {
            return ListView.builder(
              itemCount: posts.data!.length,
              itemBuilder: (context, index) => PostItem(posts.data![index]),
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
    return PostFeedState();
  }
}

const _approveButtonText = 'Aprovar';
const _rejectButtonText = 'Rejeitar';

class PostItem extends StatelessWidget {
  const PostItem(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(post.title),
          ),
          Container(
            height: 425,
            child: Player(
              videoPlayerController:
                  VideoPlayerController.network(post.assetUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(_approveButtonText),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text(_rejectButtonText),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
