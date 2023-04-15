class UserData {
  UserData(
      {required this.name,
      this.image = "Assets/Icons/Asset 2 1.png",
      this.token = "",
      this.notifications = 0,
      required this.birthDate,
      required this.email,
      required this.password});
  String name, image = "", token, password, email, birthDate;
  int notifications;
}
