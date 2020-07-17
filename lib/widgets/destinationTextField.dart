import 'package:flutter/material.dart';

class DestinationTextField extends StatefulWidget {
  @override
  _DestinationTextFieldState createState() => _DestinationTextFieldState();
}

class _DestinationTextFieldState extends State<DestinationTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Destination',
              hintStyle: TextStyle(
                  fontSize: 16.0, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
