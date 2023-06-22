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

class Locations {
  Locations(
      {required this.id,
      required this.city,
      required this.lat,
      required this.lng});
  int? id;
  String? city;
  double? lat, lng;

  Locations.fromJson(Map<String, dynamic> json)
      : lat = json["latitude"],
        lng = json["longitude"],
        city = json["locName"];

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng, "city": city};
}



// class LocationFields {
//   static final String id = "_id";
//   static final String country = "country";

//   static final String city_en = "city_en";

//   static final String city_ar = "city_ar";
// }
