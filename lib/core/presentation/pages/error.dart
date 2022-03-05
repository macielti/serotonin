import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('One error occurred')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Center(child: Icon(Icons.warning, size: 124.0)),
              SizedBox(height: 16),
              Text(
                  'We had a problem from our side, you can go back and retry the operation.')
            ],
          ),
        ),
      ),
    );
  }
}
