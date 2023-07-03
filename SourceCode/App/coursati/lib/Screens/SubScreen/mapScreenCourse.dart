import 'package:coursati/Classes/Course.dart';
import 'package:coursati/Screens/SubScreen/TrainingCenterInfoPage.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Classes/GlobalVariables.dart';

class MapScreenCourse extends StatefulWidget {
  MapScreenCourse({super.key, required this.course, required this.onTap});
  Course course;
  void Function()? onTap;
  @override
  State<MapScreenCourse> createState() => _MapScreenCourseState();
}

//
class _MapScreenCourseState extends State<MapScreenCourse> {
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
        onTap: widget.onTap,
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    _center = LatLng(widget.course.location.lat!, widget.course.location.lng!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            LatLng(widget.course.location.lat!, widget.course.location.lng!),
            widget.course.location.city!),
        onTap: (argument) {
          // Navigator.of(context).push(ScreenController()
          //     .createRoute(TrainingCenterPage(id: widget.course.id), 0));
        },
        initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
      ),
    );
  }
}
