import 'dart:io';

import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

import 'Location.dart';
import 'TagData.dart';

class TrainingCenter {
  TrainingCenter({
    required this.id,
    required this.branch,
    required this.close,
    required this.description,
    required this.email,
    required this.location,
    required this.name,
    required this.open,
    required this.phoneNumber,
    required this.rating,
    required this.tags,
    required this.image,
    required this.logo,
    this.facebook = "",
    this.website = "",
    this.viperAllow = false,
    this.whatsAppNum = "",
  });

  String id,
      name,
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

  bool viperAllow = false;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$whatsAppNum/?text="
      : "https://api.whatsapp.com/send?phone=$whatsAppNum=";

  String get viper => "viber://chat?number=$phoneNumber";
  String logo;
  List<TrainingCenterBranch>? branch;

  factory TrainingCenter.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['tags'] as List;
    List<Tag> _tags =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    var BranchOBJ = json['tags'] as List;
    List<TrainingCenterBranch> _branch =
        BranchOBJ.map((tagJson) => TrainingCenterBranch.fromJson(tagJson))
            .toList();
    return TrainingCenter(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        email: json["email"],
        description: json["description"],
        facebook: json["facebook"],
        image: json["image"],
        tags: _tags,
        phoneNumber: json["phoneNumber"],
        whatsAppNum: json["whatsApp"],
        branch: _branch,
        close: json["close"] as TimeOfDay,
        location: Locations.fromJson(json["location"]),
        open: json["open"],
        rating: json["rating"],
        website: json["website"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "email": email,
        "description": description,
        "facebook": facebook,
        "image": image,
        "tags": tags,
        "phoneNumber": phoneNumber,
        "whatsApp": whatsAppNum,
        "branch": branch,
        "close": close,
        "location": location,
        "open": open,
        "rating": rating,
        "website": website
      };
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
      image: json["image"],
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
