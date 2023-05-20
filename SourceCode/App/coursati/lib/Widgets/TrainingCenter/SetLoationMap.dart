import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/Location.dart';

class SetLocationMap extends StatefulWidget {
  const SetLocationMap({super.key});

  @override
  State<SetLocationMap> createState() => _SetLocationMapState();
}

//
class _SetLocationMapState extends State<SetLocationMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(32.87027040045473, 13.173934429128234);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng location = LatLng(15, 32);
  String name = "course";
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

  LatLng _locationPos = LatLng(0, 0);
  Set<Marker> _currentMarker = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, _locationPos);
          },
          child: Icon(
            Icons.check,
            color: Colors.white,
          )),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setState(() {
              _locationPos = LatLng(0, 0);
            });
            Navigator.pop(context, _locationPos);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "اختيار الموقع" : "Location Select",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        buildingsEnabled: true,
        onTap: (argument) {
          setState(() {
            _locationPos = LatLng(argument.latitude, argument.longitude);

            _currentMarker = {
              Marker(
                markerId: MarkerId("id"),
                position: argument,
              )
            };
          });
        },
        markers: _currentMarker,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
  }
}
