import 'package:flutter/material.dart';

const String APP_BAR_TITLE = 'One error occurred';
const String DESCRIPTION =
    'We had a problem from our side, you can go back and retry the operation.';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    this.appBarTitle = APP_BAR_TITLE,
    this.description = DESCRIPTION,
  });

  final String appBarTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Center(child: Icon(Icons.error_outline, size: 124.0)),
              SizedBox(height: 16),
              Text(description, style: TextStyle(fontSize: 16.0),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Text(''),
    );
  }
}
