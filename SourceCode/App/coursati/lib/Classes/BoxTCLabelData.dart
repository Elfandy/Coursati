import 'package:coursati/Classes/GlobalVariables.dart';

import 'Location.dart';

class BoxTCLabelData {
  BoxTCLabelData(
      {required this.name,
      required this.image,
      required this.logo,
      required this.id,
      this.locName = ""});
  String? name, logo, image;
  String? id;
  String? locName = "";

  BoxTCLabelData.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"];
    logo = json["logo"];
    image = serverStorage + json["image"];
    locName = json["locName"];
  }
}
