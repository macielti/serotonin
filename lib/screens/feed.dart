import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serotonina/bloc/post_feed.dart';
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
      body: Consumer<PostFeedBloc>(
        builder: (context, postFeedBloc, child) {
          if (postFeedBloc.loading) {
            return LoadingIndicator();
          } else {
            return ListView.builder(
              itemCount: postFeedBloc.posts.length,
              itemBuilder: (context, index) =>
                  PostItem(post: postFeedBloc.posts[index]),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Consumer<BottomBarBloc>(
            builder: (context, bottomBarBloc, child) {
              if (bottomBarBloc.loading) {
                return Center(
                  child: Text('Carregando...'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Tempo de conteúdo aprovado não utilizado'),
                        Text(
                          Duration(
                                  seconds: bottomBarBloc.curatorshipStats
                                      .approvedTotalDurationSeconds)
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
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

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await DolinhoClient().curatePost(widget.post, true);
          Provider.of<BottomBarBloc>(context, listen: false)
              .fetchCuratorshipStats();
          Provider.of<PostFeedBloc>(context, listen: false)
              .removePost(widget.post);
        } else {
          await DolinhoClient().curatePost(widget.post, false);
          Provider.of<BottomBarBloc>(context, listen: false)
              .fetchCuratorshipStats();
          Provider.of<PostFeedBloc>(context, listen: false)
              .removePost(widget.post);
        }
      },
      background: Container(
        color: Colors.lightGreen,
      ),
      secondaryBackground: Container(
        color: Colors.redAccent,
      ),
      child: Card(
        key: UniqueKey(),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(widget.post.title),
            ),
            Container(
              height: 425,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Player(
                  videoPlayerController:
                      VideoPlayerController.network(widget.post.assetUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatefulWidget {
  const PostItem({required this.post});

  final Post post;

  @override
  State<StatefulWidget> createState() {
    return _PostItemState();
  }
}
