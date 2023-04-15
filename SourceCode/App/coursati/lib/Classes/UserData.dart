class UserData {
  UserData(
      {required this.name,
      required this.image,
      required this.token,
      required this.notifications});
  String name, image = "", token;
  int notifications;
}
