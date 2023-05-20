import 'dart:io';

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
    this.ViperAllow = false,
    this.WhatsAppAllow = false,
  });
  int id;
  String name, description, phoneNumber, email, image, facebook, website;
  Locations location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;

  bool WhatsAppAllow = false, ViperAllow = false;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$phoneNumber/?text="
      : "https://api.whatsapp.com/send?phone=$phoneNumber=";

  String get viper => "viber://chat?number=$phoneNumber";
  String logo;
  List<TrainingCenterBranch>? branch;

  TrainingCenter.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        logo = json["logo"],
        email = json["email"],
        description = json["description"],
        facebook = json["facebook"],
        image = json["image"],
        tags = json["tags"],
        phoneNumber = json["phoneNum"],
        WhatsAppAllow = json["whatsApp"],
        branch = json["branch"],
        close = json["close"],
        location = json["location"],
        open = json["open"],
        rating = json["rating"],
        website = json["website"];
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
    this.WhatsAppAllow = false,
  });

  int id;
  String name, description, phoneNumber, email, image, facebook, website;
  Locations location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;

  bool WhatsAppAllow, ViperAllow;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$phoneNumber/?text="
      : "https://api.whatsapp.com/send?phone=$phoneNumber=";

  String get viper => "viber://chat?number=$phoneNumber";
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
