import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapToogleFAB extends StatefulWidget {
  @override
  _MapToogleFABState createState() => _MapToogleFABState();
}

class _MapToogleFABState extends State<MapToogleFAB> {
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        child: Icon(Icons.map),
        mini: true,
        tooltip: 'Toggle the map type',
        onPressed: _onMapTypeButtonPressed,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
}