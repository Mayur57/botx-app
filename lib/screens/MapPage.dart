import 'dart:async';
import 'package:botx/requests/google_maps_requests.dart';
import 'package:botx/widgets/advancedNavigationBar.dart';
import 'package:botx/widgets/centerFloatingActionButton.dart';
import 'package:botx/widgets/customSearchBar.dart';
import 'package:botx/widgets/mapToggleFAB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

//TODO: Save all strings into a different file : strings.dart

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Timer _timer;
  bool delayTimeoutConstant = false;
  var isGpsEnabled = Geolocator().isLocationServiceEnabled();
  static LatLng _initialPosition;
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polyLines = {};
  GoogleMapController _mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  String route;
  Set<Marker> myMarker = {};
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _setTimer();
  }

  _setTimer() {
    _timer = new Timer(Duration(milliseconds: 2000), () { //Timeout is set to 2 seconds for the location warning
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
    return _initialPosition == null
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
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
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
                      child: delayTimeoutConstant ? Text(
                        "Important: If you see this screen for more than 5 seconds, please check your Device Location settings and enable Location Services with location accuracy set to HIGH ACCURACY.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 11),
                      )
                      :  Text(" "),
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
                  mapType: _currentMapType,
                  tiltGesturesEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 16),
                  onMapCreated: _onMapCreated,
                  onLongPress: _Marker,
                  markers: myMarker,
                  polylines: Set<Polyline>.of(polyLines.values),
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
  _Marker(LatLng tappedPoint) async {
    myMarker = {};
    setState(() {
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: false,
          infoWindow: InfoWindow(
            title: tappedPoint.toString(),
            snippet: 'Cool place',
          ),
        ),
      );
      _getPolyline(tappedPoint);
    });
  }

  void _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  _getPolyline(LatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apikey,
      PointLatLng(_initialPosition.latitude, _initialPosition.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine(polylineCoordinates);
  }

  _addPolyLine(List<LatLng> cords) {
    PolylineId id = PolylineId("Poly");
    Polyline polyline =
        Polyline(polylineId: id, color: Colors.blueAccent, points: cords);
    polyLines[id] = polyline;

    setState(() {});
  }
}
