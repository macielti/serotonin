import 'package:flutter/material.dart';

const _titleAppBar = 'Posts';

class PostFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(title: Text('Título do post')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
