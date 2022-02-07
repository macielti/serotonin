import 'package:flutter/material.dart';
import 'package:serotonina/component/player.dart';
import 'package:serotonina/models/post.dart';
import 'package:video_player/video_player.dart';

const _titleAppBar = 'Posts';

class PostFeed extends StatelessWidget {

  final List<Post> posts = [Post(title: 'Test 1'), Post(title: 'Test 2')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostItem(posts[index]),
      ),
    );
  }
}

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
            height: 255,
            child: Player(
              videoPlayerController:
                  VideoPlayerController.asset('videos/example.mp4'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Aprovar'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text('Declinar'),
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
