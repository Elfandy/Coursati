import 'package:coursati/Classes/GlobalVariables.dart';

class Ads {
  Ads(
      {required this.description,
      required this.id,
      required this.image,
      required this.link,
      required this.title});
  int id;
  String title, description, link, image;

  Ads.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        link = json['link'],
        image = serverStorage + json['image'];
}
