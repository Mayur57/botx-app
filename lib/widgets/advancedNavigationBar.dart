import 'package:flutter/material.dart';

class AdvancedNavBar extends StatefulWidget {
  @override
  _AdvancedNavBarState createState() => _AdvancedNavBarState();
}

class _AdvancedNavBarState extends State<AdvancedNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                icon: Icon(
                  Icons.lock_open,
                  size: 30,
                ),
                onPressed: () {}, //TODO: Change page here
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                icon: Icon(
                  Icons.graphic_eq,
                  size: 30,
                ),
                onPressed: () {}, //TODO: Change page here
              ),
            ),
          ),
          Expanded(child: Text('')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                icon: Icon(
                  Icons.timer,
                  size: 30,
                ),
                onPressed: () {}, //TODO: Change page here
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                onPressed: () {}, //TODO: Change page here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
