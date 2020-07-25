import 'dart:async';
import 'dart:typed_data';

import 'package:botx/util/scalar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class FullScreen extends StatefulWidget {
  final String link;
  FullScreen({Key key, @required this.link}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  VlcPlayerController _videoViewController;
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Camera Feed',
              textAlign: TextAlign.justify,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white)),
        ),
        body: new RotatedBox(
            quarterTurns: 1,
            child: new VlcPlayer(
              aspectRatio: 1.974,
              url: widget.link,
              controller: _videoViewController,
              placeholder: Container(
                height: 43 * SizeConfig.heightSizeMultiplier,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator()],
                ),
              ),
            )));
  }
}
