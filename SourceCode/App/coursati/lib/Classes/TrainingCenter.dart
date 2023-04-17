import 'package:flutter/material.dart';

import 'Location.dart';
import 'Tag.dart';

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
    required this.logo,
    required this.facebook,
    required this.website,
  });
  int id;
  String name, description, phoneNumber, email, image, logo, facebook, website;
  Location location;
  TimeOfDay open, close;
  List<Tag> tags;
  double rating;
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
    required logo,
    facebook = "",
    website = "",
  }) : super(
          close: close,
          description: description,
          email: email,
          id: id,
          image: image,
          location: location,
          logo: logo,
          name: name,
          open: open,
          phoneNumber: phoneNumber,
          rating: rating,
          tags: tags,
          facebook: facebook,
          website: website,
        );

  List<TrainingCenterBranch>? branch;
}

class TrainingCenterBranch extends TrainingCenterData {
  TrainingCenterBranch({
    required id,
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
    required logo,
    facebook = "",
    website = "",
  }) : super(
          close: close,
          description: description,
          email: email,
          id: id,
          image: image,
          location: location,
          logo: logo,
          name: name,
          open: open,
          phoneNumber: phoneNumber,
          rating: rating,
          tags: tags,
          facebook: facebook,
          website: website,
        );
}
