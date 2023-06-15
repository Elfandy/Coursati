class Trainer {
  Trainer(
      {required this.discription,
      required this.id,
      required this.major,
      required this.name,
      // required this.rating,
      required this.image});

  String id;
  String name, major, discription, image;
  // double rating;

  Trainer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        major = json['major'],
        discription = json["discription"],
        image = json["image"];
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "major": major,
        "discription": discription,
        "image": image
      };
}

// class TrainerFields {
//   static final String id = "_id";
//   static final String name = "name";
//   static final String major = "major";
//   static final String discription = "discription";
//   static final String rating = "rating";
// }

class BLDTrainer {
  BLDTrainer({
    required this.id,
    required this.name,
  });
  String id;
  String name;

  BLDTrainer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
