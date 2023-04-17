class UserData {
  UserData(
      {required this.id,
      required this.name,
      this.image = "Assets/Icons/Asset 2 1.png",
      required this.token,
      this.notifications = 0,
      required this.birthDate,
      required this.email,
      required this.password,
      required this.gender});
  int id;
  String name, image, token, password, email, birthDate, gender;
  int notifications;
}

class UserFields {
  static final String id = "_id";
  static final String name = "name";
  static final String image = "image";
  static final String token = "token";
  static final String password = "password";
  static final String email = "email";
  static final String birthDate = "birthDate";
  static final String gender = "gender";
  static final String notifications = "notifications";
}
