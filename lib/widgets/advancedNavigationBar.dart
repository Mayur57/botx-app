import 'package:flutter/material.dart';

class AdvancedNavBar extends StatefulWidget {
  @override
  _AdvancedNavBarState createState() => _AdvancedNavBarState();
}

class _AdvancedNavBarState extends State<AdvancedNavBar> {
  final EdgeInsetsGeometry _iconPadding = EdgeInsets.all(8.0);
  final double _iconSize = 32;
  final Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: _iconPadding,
              child: IconButton(
                icon: Icon(
                  Icons.lock_open,
                  size: _iconSize,
                  color: _iconColor,
                ),
                onPressed: () {}, //TODO: Change page here
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: _iconPadding,
              child: IconButton(
                icon: Icon(
                  Icons.graphic_eq,
                  size: _iconSize,
                  color: _iconColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/vitals');
                }, //TODO: Change page here
              ),
            ),
          ),
          Expanded(child: Text('')),
          Expanded(
            child: Padding(
              padding: _iconPadding,
              child: IconButton(
                icon: Icon(
                  Icons.timer,
                  size: _iconSize,
                  color: _iconColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/history');
                }, //TODO: Change page here
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: _iconPadding,
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: _iconSize,
                  color: _iconColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                }, //TODO: Change page here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
