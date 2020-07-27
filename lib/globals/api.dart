library globals;
import 'package:google_maps_flutter/google_maps_flutter.dart';
const googleApiKey = "AIzaSyCxl84PVtxHN6SmJ_6RD0qPBv-SJBz7eic";
int pickUpType;
final Map<int, Marker> myMarker = {};
final Map<PolylineId, Polyline> polyLines = {};
LatLng initialPosition;
LatLng currentLocation;
