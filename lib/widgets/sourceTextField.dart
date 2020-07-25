import 'package:flutter/material.dart';

class SourceTextField extends StatefulWidget {
  @override
  _SourceTextFieldState createState() => _SourceTextFieldState();
}

class _SourceTextFieldState extends State<SourceTextField> {
  @override
  Widget build(BuildContext context) {
    List<bool> _listed = [true, false];

    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Source',
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
        ),
        ToggleButtons(
            renderBorder: false,
            children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.my_location,
              color: Colors.white60,
            ),
            onPressed: () {
              print("Select my location");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.location_on,
              color: Colors.white60,
            ),
            onPressed: () {
              print("Select marker on map");
            },
          ),
        ], isSelected: _listed),
      ],
    );
  }
}