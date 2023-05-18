import 'Location.dart';

class BoxTCLabelData {
  BoxTCLabelData(
      {required this.name,
      required this.cityAr,
      required this.cityEn,
      required this.image,
      required this.logo,
      required this.id});
  String? name, logo, image, cityAr, cityEn;
  int? id;

  BoxTCLabelData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    logo = json["logo"];
    image = json["image"];
    cityAr = json["cityAr"];
    cityEn = json["cityEn"];
  }
}
