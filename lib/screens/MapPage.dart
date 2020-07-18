import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../globals/api.dart' as global;
import 'package:botx/requests/google_maps_requests.dart';
import 'package:botx/widgets/advancedNavigationBar.dart';
import 'package:botx/widgets/centerFloatingActionButton.dart';
import 'package:botx/widgets/customSearchBar.dart';
import 'package:flutter/cupertino.dart';

//TODO: Save all strings into a different file : strings.dart

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

//Hi this was changed
class MapPageState extends State<MapPage> {
  Timer _timer;
  bool delayTimeoutConstant = false;
  var isGpsEnabled = Geolocator().isLocationServiceEnabled();
  //static LatLng _initialPosition;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  //LatLng initialPosition;
  //Map<MarkerId, Marker> myMarkers = <MarkerId, Marker>{};
  //Set<Marker> myMarker = {};


  @override
  void initState() {
    super.initState();
    getUserLocation();
    _setTimer();
  }

  _setTimer() {
    _timer = new Timer(Duration(milliseconds: 2000), () {
      //Timeout is set to 2 seconds for the location warning
      setState(() {
        delayTimeoutConstant = true;
      });
    });
  }

  void _setMapStyle(GoogleMapController controller) async {
    String style =
        await DefaultAssetBundle.of(context).loadString('map/mapstyle.json');
    _mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return global.initialPosition == null
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
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
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Fetching Device Location',
                        textAlign: TextAlign.center,
                      ),
//                      Text(
//                        'Please Wait...',
//                        textAlign: TextAlign.center,
//                      ),
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
                              style: TextStyle(fontSize: 11),
                            )
                          : Text(" "),
                    ),
                  ),
                )
              ],
            ),
          )
        : Scaffold(
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  myLocationButtonEnabled: false,
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  tiltGesturesEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: global.initialPosition, zoom: 16),
                  onMapCreated: _onMapCreated,
                  onLongPress: marker,
                  markers: global.myMarker.values.toSet(),
                  polylines: global.polyLines.values.toSet(),
                ),
                //MapToogleFAB(),
                ///Disabled due to developer request
                SearchBar(),
              ],
            ),
            floatingActionButton: CenterFAB(),
            bottomNavigationBar: AdvancedNavBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {});
    _setMapStyle(controller);
  }

  // ignore: non_constant_identifier_names

  marker(LatLng tappedPoint) async {
    switch (global.pickUpType) {
      case 1:
        setState(() {
          final marker2 = Marker(
              markerId: MarkerId(tappedPoint.toString()),
              position: tappedPoint,
              infoWindow: InfoWindow(
                title: "Destination",
              ));
          global.myMarker[2] = marker2;
          print("##########################################");
          getPolyline(global.initialPosition, tappedPoint);
        });
        break;
      case 2:
        setState(() {
          final marker2 = Marker(
              markerId: MarkerId(tappedPoint.toString()),
              position: tappedPoint,
              infoWindow: InfoWindow(
                title: "Destination",
              ));
          global.initialPosition = global.currentLocation;
          global.myMarker[2] = marker2;
          print("##########################################");
          getPolyline(global.initialPosition, tappedPoint);
        });
        break;
      case 3:
        setState(() {
          final marker1 = Marker(
              markerId: MarkerId(tappedPoint.toString()),
              position: tappedPoint,
              infoWindow: InfoWindow(
                title: "Pick-Up",
              ));
          global.myMarker[1] = marker1;
          print("==========================================");
          global.pickUpType = 1;
          global.initialPosition = tappedPoint;
        });
        break;
      default:
        setState(() {
          final marker2 = Marker(
              markerId: MarkerId(tappedPoint.toString()),
              position: tappedPoint,
              infoWindow: InfoWindow(
                title: "Destination",
              ));
          global.myMarker[2] = marker2;
          print("##########################################");
          getPolyline(global.initialPosition, tappedPoint);
        });
        break;
    }
  }

  void getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      global.currentLocation = LatLng(position.latitude, position.longitude);
      global.initialPosition = global.currentLocation;
    });
  }

  getPolyline(LatLng source, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apikey,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> cords) {
    PolylineId id = PolylineId("Poly");
    Polyline polyline =
        Polyline(polylineId: id, color: Colors.blueAccent, points: cords);
    global.polyLines[id] = polyline;
    print("----------------POLYLINE---------------------");
    print(global.polyLines.values.toSet().toString());
    setState(() {});
  }
}



