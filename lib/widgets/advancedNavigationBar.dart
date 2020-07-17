import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdvancedNavBar extends StatefulWidget {
  @override
  _AdvancedNavBarState createState() => _AdvancedNavBarState();
}

class _AdvancedNavBarState extends State<AdvancedNavBar> {
  final EdgeInsetsGeometry _iconPadding = EdgeInsets.all(8.0);
  final double _iconSize = 32;
  final Color _iconColor = Colors.white;
  FToast fToast;
  bool deviceStateUnlocked = false;
  bool lockIconState = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
  }

  _showToast() {
    Widget toast = deviceStateUnlocked
        ? ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 25.0,
                sigmaX: 25.0,
              ),
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.25),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_open,
                        size: 60,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Device Unlocked",
                        style: TextStyle(fontSize: 25, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 25.0,
                sigmaX: 25.0,
              ),
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.25),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 60,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Device Locked",
                        style: TextStyle(fontSize: 25, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );

    //Toggle state after device toast is shown
    toggleUnlockState();
  }

  toggleUnlockState() {
    deviceStateUnlocked = !deviceStateUnlocked;
  }

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
                icon: !lockIconState
                    ? Icon(
                        Icons.lock_open,
                        size: _iconSize,
                        color: _iconColor,
                      )
                    : Icon(
                        Icons.lock_outline,
                        size: _iconSize,
                        color: _iconColor,
                      ),
                onPressed: () {
                  _showToast();
                  setState(() {
                    lockIconState = !lockIconState;
                  });
                }, //TODO: Change page here
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
