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
  bool deviceState = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
  }

  _showToast() {
    Widget toast = deviceState
        ? Container(
            //Device unlocked
            width: 500,
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.greenAccent.withOpacity(0.9),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_open,
                    size: 30,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "Device Unlocked",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          )
        : Container(
            //Device Locked
            width: 500,
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.redAccent.withOpacity(0.9),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 30,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "Device Locked",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
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
    deviceState = !deviceState;
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
                icon: Icon(
                  Icons.lock_open,
                  size: _iconSize,
                  color: _iconColor,
                ),
                onPressed: () {
                  _showToast();
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
