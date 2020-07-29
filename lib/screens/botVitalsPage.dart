import 'dart:async';
import 'dart:typed_data';

import 'package:botx/screens/fullScreen.dart';
import 'package:botx/util/scalar.dart';
import 'package:botx/widgets/batteryIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class BotVitalsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppScaffoldState();
}

class MyAppScaffoldState extends State<BotVitalsPage> {
  String url;
  Future botVitals;
  bool _clicked = false;
  VlcPlayerController _videoViewController;
  void initState() {
    super.initState();
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      setState(() {});
    });
  }

  _onPressed() {
    setState(() {
      _clicked = true;
      url =
          "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Bot Vitals',
          textAlign: TextAlign.justify,
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: new Container(
        color: Colors.black,
        padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
        child: Column(children: <Widget>[
          BatteryIndicator(70.0),
          SizedBox(
            height: 3 * SizeConfig.heightSizeMultiplier,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.longestSide * 0.49,
            child: new Column(
              children: <Widget>[
                new Card(
                  color: Colors.black.withOpacity(0.8),
                  shadowColor: Colors.blue,
                  elevation: 0,
                  child: new Container(
                    //padding: new EdgeInsets.all(190.0),
                    padding: const EdgeInsets.only(
                        top: 11.0, right: 11.0, left: 11.0, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.longestSide * 0.48,
                    //padding : new EdgeInsets.all(MediaQuery.of(context).size.height/4),
                    child:  new Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 39 * SizeConfig.heightSizeMultiplier,
                          width: MediaQuery.of(context).size.width,
                          child: (_clicked) ? new VlcPlayer(
                            aspectRatio: 16 / 9,
                            url: url,
                            controller: _videoViewController,
                            placeholder: Container(
                              height: 250.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[CircularProgressIndicator()
                                ],
                              ),
                            ),
                          ) : Container(
                            height: 250.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[new Text("Click the 'Watch' button below to view the camera feed",
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontFamily: 'Circular Medium',
                                      color: Colors.white,
                                      fontSize: 1.6 *
                                          SizeConfig.heightSizeMultiplier,
                                      fontWeight: FontWeight.bold))
                              ],
                            ),
                          ) ,
                        ),
                        SizedBox(
                          height: 0.5 * SizeConfig.heightSizeMultiplier,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 35.19 * SizeConfig.widthSizeMultiplier,
                              height: 5 * SizeConfig.heightSizeMultiplier,
                              child: FlatButton(
                                onPressed: () {
                                  _onPressed();
                                },
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  'Watch',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Verto Medium'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3 * SizeConfig.heightSizeMultiplier,
                            ),
                            ButtonTheme(
                              minWidth: 35.19 * SizeConfig.widthSizeMultiplier,
                              height: 5 * SizeConfig.heightSizeMultiplier,
                              child: FlatButton(
                                onPressed: (_clicked) ?() {
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FullScreen(link: url),
                                        ));
                                  }
                                } : (){

                                },
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  'Full Screen',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Verto Medium'),
                                ),
                              ),
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
                  blurRadius: 5.0,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
