import 'package:flutter/material.dart';

const String _loadingLabel = 'Carregando Posts...';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_loadingLabel),
          SizedBox(height: 16),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
