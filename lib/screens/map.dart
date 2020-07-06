import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Fake and lame",
          style: TextStyle(
            fontSize: 36,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
