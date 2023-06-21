class TCLocation {
  TCLocation(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name});
  String name;
  int id;
  double lat, lng;

  TCLocation.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        lat = json["latitude"],
        lng = json["longitude"],
        name = json["name"];
}
