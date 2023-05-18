class Trainer {
  Trainer(
      {required this.discription,
      required this.id,
      required this.major,
      required this.name,
      // required this.rating,
      required this.image});

  int id;
  String name, major, discription, image;
  // double rating;

  Trainer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        major = json['major'],
        discription = json["discription"],
        image = json["image"];
}

// class TrainerFields {
//   static final String id = "_id";
//   static final String name = "name";
//   static final String major = "major";
//   static final String discription = "discription";
//   static final String rating = "rating";
// }
