import 'package:flutter/material.dart';
import 'package:botx/screens/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BotX',
      home: MapPage(),
    );
  }
}
