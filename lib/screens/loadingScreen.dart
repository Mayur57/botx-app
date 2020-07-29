import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer _timer;
  bool delayTimeoutConstant = false;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  _setTimer() {
    _timer = new Timer(Duration(milliseconds: 4000), () {
      //Timeout is set to 4 seconds for the location warning
      setState(() {
        delayTimeoutConstant = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 70,
                          width: 70,
                          child: SpinKitWave(
                            color: Colors.blueAccent,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Fetching Device Location',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 70,
                child: delayTimeoutConstant
                    ? Text(
                  "Important: If you see this screen for more than 5 seconds, please check your Device Location settings and enable Location Services with location accuracy set to HIGH ACCURACY.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )
                    : Text(" "),
              ),
            ),
          )
        ],
      ),
    );
  }
}
