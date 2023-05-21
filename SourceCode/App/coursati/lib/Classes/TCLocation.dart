class TCLocation {
  TCLocation(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name});
  String id, name;
  double lat, lng;

  TCLocation.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        lat = json["lat"],
        lng = json["lng"],
        name = json["name"];
}
