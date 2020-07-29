import '../../globals/api.dart' as global;
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class SourceTextField extends StatefulWidget {
  @override
  SourceTextFieldState createState() => SourceTextFieldState();
}

class SourceTextFieldState extends State<SourceTextField> {
  TextEditingController source = TextEditingController();
  int state;
  static int ML_BUTTON_STATE = 0; //My Location Button State
  static int CM_BUTTON_STATE = 1; //Custom Marker Button State
  static int TF_BUTTON_STATE = -999; //Text Field Button State
  int selectedButtonState = ML_BUTTON_STATE;


  _changeState() {
    setState(() {
      selectedButtonState != CM_BUTTON_STATE
          ? selectedButtonState = CM_BUTTON_STATE
          : selectedButtonState = ML_BUTTON_STATE;
    });
  }

  _textFieldSelectedState() {
    setState(() {
      selectedButtonState = TF_BUTTON_STATE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            onTap: () async {
//              _textFieldSelectedState();
              Prediction predictor = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: global.googleApiKey,
                  language: "en",
                  components: [Component(Component.country, "in")]);
              if (predictor != null) {
                source.text = predictor.description;
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
        Padding(
          //selectedState
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Container(
            decoration: selectedButtonState == ML_BUTTON_STATE ? new BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
//                    border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ) : new BoxDecoration(
              color: Colors.blue.withOpacity(0.0),
//                    border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ) ,
            child: IconButton(
              icon: Icon(
                Icons.my_location,
                color: Colors.white60,
              ),
              onPressed: () {
                state = 2;
                setState(() {
                  if(selectedButtonState != ML_BUTTON_STATE){
                    _changeState();
                  }
                  print(
                      "====================CURRENT LOCATION===================");
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
          ),
        ),
        Padding(
          //selectedState
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Container(
            decoration: selectedButtonState == CM_BUTTON_STATE ? new BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
//                    border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ) : new BoxDecoration(
              color: Colors.blue.withOpacity(0.0),
//                    border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.location_on,
                color: Colors.white60,
              ),
              onPressed: () {
                state = 3;
                setState(() {
                  if(selectedButtonState != CM_BUTTON_STATE){
                    _changeState();
                  }
                  print(
                      "=====================MARKER========================");
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
          ),
        )
      ],
    );
  }
}
