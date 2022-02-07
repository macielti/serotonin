import 'package:flutter/material.dart';
import 'package:serotonina/component/player.dart';
import 'package:video_player/video_player.dart';

const _titleAppBar = 'Posts';

class PostFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostItem(),
            PostItem(),
            PostItem(),
            PostItem(),
            PostItem(),
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text('Título do post'),
          ),
          Container(
            height: 400,
            child: Player(
              videoPlayerController:
                  VideoPlayerController.asset('videos/example.mp4'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          )
        ],
      ),
    );
  }
}
