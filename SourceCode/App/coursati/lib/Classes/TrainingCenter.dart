import 'package:flutter/material.dart';

import 'Location.dart';
import 'Tag.dart';

class TrainingCenter {
  int? id;
  String? name, description, phoneNumber, email;
  Location? location;
  TimeOfDay? open, close;
  Tag? tag;
  List<TrainingCenterBranch>? branch;
  double? rating;
}

class TrainingCenterBranch {
  int? id;
  String? name, description, phoneNumber, email;
  Location? location;
  TimeOfDay? open, close;
  Tag? tag;
  double? rating;
}
