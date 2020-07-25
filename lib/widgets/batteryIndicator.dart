import 'package:botx/util/scalar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class BatteryIndicator extends StatelessWidget {
  double percent;
  BatteryIndicator(double percent) {
    // ignore: unnecessary_statements
    this.percent;
  }

  @override
  Widget build(BuildContext context) {
    //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
    return new Column(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.longestSide * 0.32,
          child: new Column(
            children: <Widget>[
              new Card(
                color: Colors.black.withOpacity(0.8),
                shadowColor: Colors.blue,
                elevation: 20,
                child: new Container(
                  //padding: new EdgeInsets.all(190.0),
                  padding: const EdgeInsets.only(
                      top: 11.0, right: 20.0, left: 20.0, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.longestSide * 0.31,
                  //padding : new EdgeInsets.all(MediaQuery.of(context).size.height/4),
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(
                            "Battery",
                            style: TextStyle(
                                fontFamily: 'Circular Medium',
                                color: Colors.white,
                                fontSize: 4 * SizeConfig.heightSizeMultiplier,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightSizeMultiplier,
                      ),
                      new Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircularPercentIndicator(
                            radius: 170.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 15.0,
                            percent: 0.7,
                            center: new Text(
                              "70%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            progressColor: Colors.blue,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.blue,
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BatteryIndicatorWaiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
    return new Column(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.longestSide * 0.32,
          child: new Column(
            children: <Widget>[
              new Card(
                color: Colors.black.withOpacity(0.8),
                shadowColor: Colors.blue,
                elevation: 20,
                child: new Container(
                  //padding: new EdgeInsets.all(190.0),
                  padding: const EdgeInsets.only(
                      top: 11.0, right: 20.0, left: 20.0, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.longestSide * 0.31,
                  //padding : new EdgeInsets.all(MediaQuery.of(context).size.height/4),
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(
                            "Battery",
                            style: TextStyle(
                                fontFamily: 'Circular Medium',
                                color: Colors.white,
                                fontSize: 4 * SizeConfig.heightSizeMultiplier,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightSizeMultiplier,
                      ),
                      new Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[new CircularProgressIndicator()],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.blue,
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BatteryIndicatorNone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
    return new Column(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.longestSide * 0.32,
          child: new Column(
            children: <Widget>[
              new Card(
                color: Colors.black.withOpacity(0.8),
                shadowColor: Colors.blue,
                elevation: 20,
                child: new Container(
                  //padding: new EdgeInsets.all(190.0),
                  padding: const EdgeInsets.only(
                      top: 11.0, right: 20.0, left: 20.0, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.longestSide * 0.31,
                  //padding : new EdgeInsets.all(MediaQuery.of(context).size.height/4),
                  child: new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text(
                            "Battery",
                            style: TextStyle(
                                fontFamily: 'Circular Medium',
                                color: Colors.white,
                                fontSize: 4 * SizeConfig.heightSizeMultiplier,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2 * SizeConfig.heightSizeMultiplier,
                      ),
                      new Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                              "No bot selected!",
                              style: TextStyle(
                                  fontFamily: 'Circular Medium',
                                  color: Colors.white,
                                  fontSize: 1.2 * SizeConfig.heightSizeMultiplier,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.blue,
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
