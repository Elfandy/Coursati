import 'dart:io';

import 'package:flutter/material.dart';

import 'Location.dart';
import 'TagData.dart';

class TrainingCenterData {
  TrainingCenterData({
    required this.id,
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
    required this.facebook,
    required this.website,
    required this.ViperAllow,
    required this.WhatsAppAllow,
  });

  int id;
  String name, description, phoneNumber, email, image, facebook, website;
  Location location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;

  bool WhatsAppAllow, ViperAllow;

  String get whatsApp => (Platform.isIOS)
      ? "whatsapp://wa.me/$phoneNumber/?text="
      : "https://api.whatsapp.com/send?phone=$phoneNumber=";

  String get viper => "viber://chat?number=$phoneNumber";
}
class TrainingCenter extends TrainingCenterData {
  TrainingCenter({
    required id,
    required this.branch,
    required close,
    required description,
    required email,
    required location,
    required name,
    required open,
    required phoneNumber,
    required rating,
    required tags,
    required image,
    required this.logo,
    facebook = "",
    website = "",
    viperAllow = false,
    whatsAppAllow = false,
  }) : super(
          close: close,
          description: description,
          email: email,
          id: id,
          image: image,
          location: location,
          name: name,
          open: open,
          phoneNumber: phoneNumber,
          rating: rating,
          tags: tags,
          facebook: facebook,
          website: website,
          ViperAllow: viperAllow,
          WhatsAppAllow: whatsAppAllow,
        );

  String logo;
  List<TrainingCenterBranch>? branch;
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

class TrainingCenterBranch extends TrainingCenterData {
  TrainingCenterBranch({
    required id,
    required close,
    required description,
    required email,
    required location,
    required name,
    required open,
    phoneNumber = "",
    required rating,
    required tags,
    required image,
    facebook = "",
    website = "",
    viperAllow = false,
    whatsAppAllow = false,
  }) : super(
          close: close,
          description: description,
          email: email,
          id: id,
          image: image,
          location: location,
          name: name,
          open: open,
          phoneNumber: phoneNumber,
          rating: rating,
          tags: tags,
          facebook: facebook,
          website: website,
          ViperAllow: viperAllow,
          WhatsAppAllow: whatsAppAllow,
        );
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
