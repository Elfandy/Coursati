import 'package:coursati/Classes/GlobalVariables.dart';

class BoxCourseLabelData {
  BoxCourseLabelData(
      {required this.location_in,
      required this.name,
      required this.image,
      required this.id,
      this.state,
      this.courseID});
  String? location_in;
  String? name;
  String? image;
  String? id;
  String? courseID;
  int? state;

  BoxCourseLabelData.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"];
    image = serverStorage + json["image"].trim();
    location_in = json["locName"] ?? '';
    courseID = json['courseID'] ?? '';
    state = json['state'] ?? 0;
  }

  Map<String, dynamic> toJson() =>
      {'id': id, "name": name, "image": image, "location_in": location_in};
}
