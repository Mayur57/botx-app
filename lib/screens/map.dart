import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {
  static LatLng _initialPosition;
  //GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Completer<GoogleMapController> _controller = Completer();
  //TextEditingController locationController = TextEditingController();
  //TextEditingController destinationController = TextEditingController();
  //Set<Polyline> _polyLines = {};
  Map<PolylineId, Polyline> polyLines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String route;
  //Set<Polyline> get polyLines => _polyLines;
  final googleApiKey = "AIzaSyCxl84PVtxHN6SmJ_6RD0qPBv-SJBz7eic";

  Set<Marker> myMarker = {};
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }


  @override
  Widget build(BuildContext context) {
    return _initialPosition == null
        ? Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text(
              'Getting Location',
              textAlign: TextAlign.center,
            ),
          ]),
    )
        : new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            mapType: _currentMapType,
            tiltGesturesEnabled: true,
            initialCameraPosition:
            CameraPosition(target: _initialPosition, zoom: 20),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onLongPress: _Marker,
            markers: myMarker,
            polylines: Set<Polyline>.of(polyLines.values),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: FloatingActionButton(
              onPressed: _onMapTypeButtonPressed,
              child: Icon(Icons.map),
            ),
          )
        ],
      ),
    );
  }

  //Future<void> _goToTheLake() async {
  //  final GoogleMapController controller = await _controller.future;
  //  controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  //}

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _Marker(LatLng tappedPoint) {
    //print(tappedPoint);
    myMarker = {};
    setState(() {
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: false,
          infoWindow: InfoWindow(
            title: tappedPoint.toString(),
            snippet: 'Cool place',
          )));
      _getPolyline(tappedPoint);
    });
  }

  // using GeoLocator to receive the current location
  void _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    //List<Placemark> placemark = await Geolocator()
    //  .placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      // locationController.text = placemark[0].name;
    });
  }

  _getPolyline(LatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCxl84PVtxHN6SmJ_6RD0qPBv-SJBz7eic",
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
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.blueAccent, points: cords);
    polyLines[id] = polyline;

    setState(() {});
  }
}
