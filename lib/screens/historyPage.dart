import 'package:botx/util/scalar.dart';
import 'package:botx/widgets/historyCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool switchControl = false;
  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        textHolder = 'Switch is ON';
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        switchControl = false;
        textHolder = 'Switch is OFF';
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Task History',
          textAlign: TextAlign.justify,
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.075,
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Show Favorites", style: TextStyle(color: Colors.white, fontSize: 18),),
                    Switch(value: switchControl, onChanged: toggleSwitch, activeColor: Colors.deepOrange,),
                  ],
                ),
              ),),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
                HistoryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
