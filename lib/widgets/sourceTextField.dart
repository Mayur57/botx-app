import 'package:botx/screens/MapPage.dart';
import '../globals/api.dart' as global;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class SourceTextField extends StatefulWidget {
  @override
  SourceTextFieldState createState() => SourceTextFieldState();
}

class SourceTextFieldState extends State<SourceTextField> {
  MapPageState myMap = MapPageState();
  TextEditingController source = TextEditingController();
  int state;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            onTap: () async {
              Prediction p = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: global.googleApiKey,
                  language: "en",
                  components: [Component(Component.country, "in")]);
              if (p != null) {
                source.text = p.description;
              }
            },
            controller: source,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Source',
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.my_location,
            color: Colors.white60,
          ),
          onPressed: () {
            state = 2;
            setState(() {
              print("====================CURRENT LOCATION===================");
              global.polyLines.remove("Poly");
              global.myMarker.remove(1);
              global.myMarker.remove(2);
              global.myMarker.clear();
              global.polyLines.clear();
              print(global.pickUpType);
              global.initialPosition = global.currentLocation;
              global.pickUpType = state;
              print("Select my location");
              print(global.pickUpType);
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.location_on,
            color: Colors.white60,
          ),
          onPressed: () {
            state = 3;
            setState(() {
              print("=====================MARKER========================");
              global.polyLines.remove("Poly");
              global.myMarker.remove(1);
              global.myMarker.remove(2);
              global.myMarker.clear();
              global.polyLines.clear();
              print(global.pickUpType);
              global.pickUpType = state;
              print("Select marker on map");
              print(global.pickUpType);
            });
          },
        ),
      ],
    );
  }
}