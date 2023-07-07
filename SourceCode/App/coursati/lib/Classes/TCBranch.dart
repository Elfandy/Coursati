import 'package:flutter/material.dart';

class TcBranch {
  TcBranch({required this.id, required this.locName});
  String locName;
  int id;

  TcBranch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        locName = json['locName'];
}
