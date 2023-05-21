import 'Location.dart';

class BoxTCLabelData {
  BoxTCLabelData(
      {required this.name,
      required this.image,
      required this.logo,
      required this.id});
  String? name, logo, image;
  String? id;

  BoxTCLabelData.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"];
    logo = json["logo"];
    image = json["image"];
  }
}
