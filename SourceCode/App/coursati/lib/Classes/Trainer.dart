class Trainer {
  Trainer(
      {required this.discription,
      required this.id,
      required this.major,
      required this.name,
      required this.rating});

  int id;
  String name, major, discription;
  double rating;
}

class TrainerFields {
  static final String id = "_id";
  static final String name = "name";
  static final String major = "major";
  static final String discription = "discription";
  static final String rating = "rating";
}
