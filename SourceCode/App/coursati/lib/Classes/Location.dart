import 'dart:convert';

import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:json_annotation/json_annotation.dart';

class Location {
  Location({required this.id, required this.city_ar, required this.city_en});
  int id;
  static String country = "Libya";
  String city_en, city_ar;
}

class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  double? lat;
  double? lng;

  LatLng.fromJson(Map<String, dynamic> json)
      : lat = json["Lat"],
        lng = json["Lng"];
  Map<String, dynamic> toJson() => {"Lat": lat, "Lng": lng};
}

class Region {
  Region({
    required this.coords,
    required this.id,
    required this.name,
    required this.zoom,
  });

  LatLng? coords;
  String? id;
  String? name;
  double? zoom;

  Region.fromJson(Map<String, dynamic> json)
      : coords = json["coords"],
        id = json["id"],
        name = json["name"],
        zoom = json["zoom"];
  Map<String, dynamic> toJson() =>
      {"coords": coords, "id": id, "name": name, "zoom": zoom};
}

class Office {
  Office({
    required this.address,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });

  String? address;
  String? id;
  String? image;
  double? lat;
  double? lng;
  String? name;
  String? phone;
  String? region;

  Office.fromJson(Map<String, dynamic> json)
      : address = json["address"],
        id = json["id"],
        image = json["image"],
        lat = json["lat"],
        lng = json["lng"],
        name = json["name"],
        phone = json["phone"],
        region = json["region"];
  Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "image": image,
        "lat": lat,
        "lng": lng,
        "name": name,
        "phone": phone,
        "region": region
      };
}

class Locations {
  Locations(
      {required this.id,
      required this.city_ar,
      required this.city_en,
      required this.lat,
      required this.lng});
  int? id;
  static String country = "Libya";
  String? city_en, city_ar;
  double? lat, lng;

  Locations.fromJson(Map<String, dynamic> json)
      : lat = json["lat"],
        lng = json["lng"],
        city_en = json["city_en"],
        city_ar = json["city_ar"];

  Map<String, dynamic> toJson() =>
      {"lat": lat, "lng": lng, "city_en": city_en, "city_ar": city_ar};
}

Future<Locations> getGoogleOffices() async {
  const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // Retrieve the locations of Google offices
  try {
    final response = await dioTestApi.get(googleLocationsURL);
    if (response.statusCode == 200) {
      return Locations.fromJson(
          json.decode(response.data) as Map<String, dynamic>);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ) as Map<String, dynamic>,
  );
}


// class LocationFields {
//   static final String id = "_id";
//   static final String country = "country";

//   static final String city_en = "city_en";

//   static final String city_ar = "city_ar";
// }
