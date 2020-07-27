import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          color: Colors.lightBlueAccent.withOpacity(0.2),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Start Place",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                        Text(
                          "07/12/2020",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "14:23:22",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "End Place",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                        Text(
                          "07/12/2020",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "14:56:08",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.white54,
                thickness: 2,
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    child: Text(
                      "TASK #69",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                        child: IconButton(
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
