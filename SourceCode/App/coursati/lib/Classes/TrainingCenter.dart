import 'dart:io';

import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

import 'Location.dart';
import 'TagData.dart';

class TrainingCenter {
  TrainingCenter(
      {this.id = '0',
      required this.close,
      required this.description,
      required this.email,
      required this.location,
      required this.name,
      required this.open,
      required this.phoneNumber,
      this.rating = 1.0,
      required this.tags,
      required this.image,
      required this.logo,
      this.facebook = "",
      this.website = "",
      this.viperAllow = false,
      this.whatsAppNum = "",
      this.branchCount});

  String id, name, description, phoneNumber, email, image, logo;
  String? facebook, website, whatsAppNum;
  Locations location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;
  int? branchCount;

  bool viperAllow = false;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$whatsAppNum/?text="
      : "https://api.whatsapp.com/send?phone=$whatsAppNum=";

  String get viper => "viber://chat?number=$phoneNumber";

  factory TrainingCenter.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['tags'] as List;
    List<Tag> _tags =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    // var BranchOBJ = json['tags'] as List;
    // List<TrainingCenterBranch> _branch =
    //     BranchOBJ.map((tagJson) => TrainingCenterBranch.fromJson(tagJson))
    //         .toList();
    // String _close = json["closeTime"].toString();
    // int hhC = 0;
    // if (_close.endsWith('PM')) hhC = 12;
    // _close = _close.split(' ')[0];
    // TimeOfDay _closeTime = TimeOfDay(
    //   hour: hhC +
    //       int.parse(_close.split(":")[0]) %
    //           24, // in case of a bad time format entered manually by the user
    //   minute: int.parse(_close.split(":")[1]) % 60,
    // );

    // String _start = json["openTime"].toString();
    // int hhs = 0;
    // if (_start.endsWith('PM')) hhs = 12;
    // _start = _start.split(' ')[0];
    // TimeOfDay _starttime = TimeOfDay(
    //   hour: hhs +
    //       int.parse(_start.split(":")[0]) %
    //           24, // in case of a bad time format entered manually by the user
    //   minute: int.parse(_start.split(":")[1]) % 60,
    // );

    return TrainingCenter(
        id: json["id"].toString(),
        name: json["name"],
        logo: serverStorage + json["logo"].trim(),
        email: json["email"],
        description: json["description"],
        facebook: json["facebook"],
        image: serverStorage + json["image"].trim(),
        tags: _tags,
        phoneNumber: json["phonenumber"],
        whatsAppNum: json["whatsapp"],
        close: TimeOfDay(
            hour: (json["closeTime"].round() as int),
            minute: (int.parse(json["closeTime"].toString().split('.').last))),
        location: Locations(
            lat: json["latitude"],
            lng: json["longitude"],
            city: json["locName"],
            id: 1),
        open: TimeOfDay(
            hour: (json["openTime"].round() as int),
            minute: (int.parse(json["openTime"].toString().split('.').last))),
        rating: double.parse(json["rate"]),
        website: json["website"],
        branchCount: json['branchcount']);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
        "email": email,
        "description": description,
        "facebook": facebook,
        "image": image,
        "tags": tags,
        "phoneNumber": phoneNumber,
        "whatsApp": whatsAppNum,
        "close": close,
        "location": location,
        "open": open,
        "website": website
      };

  TimeOfDay timefromString(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];
    return TimeOfDay(
      hour: hh +
          int.parse(time.split(":")[0]) %
              24, // in case of a bad time format entered manually by the user
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }
}

// class TrainingCenterFields {
//   static final String id = "_id";
//   static final String branch = "branch";
//   static final String close = "close";
//   static final String description = "description";
//   static final String email = "email";
//   static final String location = "location";
//   static final String name = "name";
//   static final String open = "open";
//   static final String phoneNumber = "phoneNumber";
//   static final String rating = "rating";
//   static final String tags = "tags";
//   static final String image = "image";
//   static final String logo = "logo";
//   static final String facebook = "facebook";
//   static final String website = "website";
//   static final String viperAllow = "viperAllow";
//   static final String whatsAppAllow = "whatsAppAllow";
// }

class TrainingCenterBranch {
  TrainingCenterBranch({
    required this.id,
    required this.close,
    required this.description,
    required this.email,
    required this.location,
    required this.name,
    required this.open,
    this.phoneNumber = "",
    required this.rating,
    required this.tags,
    required this.image,
    this.facebook = "",
    this.website = "",
    this.ViperAllow = false,
    this.whatsAppNum = "",
  });

  int id;
  String name,
      description,
      phoneNumber,
      email,
      image,
      facebook,
      website,
      whatsAppNum;
  Locations location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;

  bool ViperAllow;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$whatsAppNum;/?text="
      : "https://api.whatsapp.com/send?phone=$whatsAppNum;=";

  String get viper => "viber://chat?number=$phoneNumber";

  factory TrainingCenterBranch.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['tags'] as List;
    List<Tag> _tags =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

    return TrainingCenterBranch(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      description: json["description"],
      facebook: json["facebook"],
      image: serverStorage + json["image"],
      tags: _tags,
      phoneNumber: json["phoneNumber"],
      whatsAppNum: json["whatsApp"],
      close: json["close"],
      location: Locations.fromJson(json["location"]),
      open: json["open"],
      rating: json["rating"],
      website: json["website"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "description": description,
        "facebook": facebook,
        "image": image,
        "tags": tags,
        "phoneNumber": phoneNumber,
        "whatsApp": whatsAppNum,
        "close": close,
        "location": location,
        "open": open,
        "rating": rating,
        "website": website
      };
}

// class TrainingCenteBranchFields {
//   static final String id = "_id";
//   static final String close = "close";
//   static final String description = "description";
//   static final String email = "email";
//   static final String location = "location";
//   static final String name = "name";
//   static final String open = "open";
//   static final String phoneNumber = "phoneNumber";
//   static final String rating = "rating";
//   static final String tags = "tags";
//   static final String image = "image";
//   static final String facebook = "facebook";
//   static final String website = "website";
//   static final String viperAllow = "viperAllow";
//   static final String whatsAppAllow = "whatsAppAllow";
// }
