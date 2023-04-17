import 'Location.dart';

class BoxTCLabelData {
  BoxTCLabelData(
      {required this.name,
      required this.address,
      required this.image,
      required this.logo,
      required this.id});
  String name, logo, image;
  int id;
  Location address;
}
