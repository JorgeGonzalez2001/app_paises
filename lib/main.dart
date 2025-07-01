import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Ecuador'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Colombia'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Peru'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}