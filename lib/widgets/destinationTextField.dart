import 'package:botx/screens/MapPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as gws;
import 'package:flutter_google_places/flutter_google_places.dart';
import '../globals/api.dart' as global;

class DestinationTextField extends StatefulWidget {
  @override
  _DestinationTextFieldState createState() => _DestinationTextFieldState();
}

class _DestinationTextFieldState extends State<DestinationTextField> {
  TextEditingController destination = TextEditingController();

  //final MapPageState _myMap = MapPageState.instance;
  //MapPageState myMap = MapPageState();

  LatLng dest;
  int state;
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            onTap: () async {
              gws.Prediction p = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: global.googleApiKey,
                  language: "en",
                  components: [gws.Component(gws.Component.country, "in")]);
              if (p != null) {
                destination.text = p.description;
              }
            },
            controller: destination,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Destination',
              hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}