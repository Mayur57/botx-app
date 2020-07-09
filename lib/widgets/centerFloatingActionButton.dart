import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterFAB extends StatefulWidget {
  @override
  _CenterFABState createState() => _CenterFABState();
}

class _CenterFABState extends State<CenterFAB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      width: 65.0,
      child: FittedBox(
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
          onPressed: () {},
          tooltip: 'New Request',
          child: Transform.rotate(
            angle: 270 * pi / 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.send,
                size: 30,
              ),
            ),
          ),
          elevation: 4.0,
        ),
      ),
    );
  }
}
