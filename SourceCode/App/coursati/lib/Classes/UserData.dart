class UserData {
  UserData(
      {required this.name,
      this.image = "Assets/Icons/Asset 2 1.png",
      required this.token,
      this.notifications = 0,
      required this.birthDate,
      required this.email,
      required this.password,
      required this.gender});
  String name, image, token, password, email, birthDate, gender;
  int notifications;
}
