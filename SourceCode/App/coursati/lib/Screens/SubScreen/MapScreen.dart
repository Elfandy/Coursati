import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/Location.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key, required this.loc});
  Locations loc;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

//
class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(32.87027040045473, 13.173934429128234);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle((isDark) ? _mapStyle : "[]");
  }

  String _mapStyle = "";

  void initState() {
    // TODO: implement initState
    rootBundle
        .loadString('Assets/GoogleMapsTheme/DarkTheme.txt')
        .then((string) {
      _mapStyle = string;
    });
    super.initState();
  }
// void _currentLocation() async {

//     // Create a map controller
//     final GoogleMapController controller = await _controller.future;
//     LocationData currentLocation;
//     var location = new Location();
//     try {
//         // Find and store your location in a variable
//         currentLocation = await location.getLocation();
//     } on Exception {
//         currentLocation = null;
//     }

//     // Move the map camera to the found location using the controller
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//             bearing: 0,
//             target: LatLng(currentLocation.latitude, currentLocation.longitude),
//             zoom: 17.0,
//         ),
//     ));
// }

  Set<Marker> _createMarker(LatLng location, String markerName) {
    return {
      Marker(
        markerId: MarkerId(markerName),
        position: location,
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    _center = LatLng(widget.loc.lat!, widget.loc.lng!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "الموقع" : "Location",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        buildingsEnabled: true,
        myLocationEnabled: true,
        markers: _createMarker(
            LatLng(widget.loc.lat!, widget.loc.lng!), widget.loc.city!),
        initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
      ),
    );
  }
}
