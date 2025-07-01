import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Image.network(
                'https://picsum.photos/400/600?random=1',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Image.network(
                'https://picsum.photos/400/600?random=2',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}