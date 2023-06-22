import 'GlobalVariables.dart';
import 'Location.dart';
import 'TagData.dart';
import 'Trainer.dart';
import 'TrainingCenter.dart';

// class CourseFields {
//   static final String id = "id";
//   static final String name = "name";

//   static final String duration = "duration";
//   static final String tags = "tags";

//   static final String price = "price";

//   static final String active = "active";

//   static final String discount = "discount";

//   static final String startingDate = "startingDate";

//   static final String trainer = "trainer";

//   static final String trainingCenter = "trainingCenter";

//   static final String description = "description";
//   static final String full = "full";
// }

class Course {
  Course({
    required this.id,
    required this.duration,
    required this.name,
    this.tags = const [],
    required this.price,
    this.discount = 0,
    required this.startingDate,
    required this.active,
    required this.trainer,
    required this.trainingCenterID,
    required this.description,
    this.full = false,
    required this.image,
    required this.location,
    this.icon = "",
    this.trainingCenterName = "",
    this.periodsRepeats,
    this.repeats = false,
    required this.trainerData,
    this.period,
  });
  final int duration, active;
  int? periodsRepeats, period;
  final String id,
      name,
      trainer,
      description,
      image,
      icon,
      trainingCenterName,
      trainingCenterID;
  final List<Tag> tags;

  final double price, discount;
  final DateTime startingDate;
  final bool full, repeats;
  final Locations location;
  final Trainer trainerData;

  factory Course.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['tags'] as List;
    List<Tag> _tags =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    return Course(
        name: json['name'],
        duration: json['duration'] as int,
        image: serverStorage + json['image'],
        trainer: json['trainers'],
        trainingCenterID: json['TC'].toString(),
        periodsRepeats: json['periodsRepeats'],
        period: json['period'],
        description: json['description'],
        id: json['id'].toString(),
        trainingCenterName: json['TCname'],
        tags: _tags,
        price: json['price'],
        startingDate: DateTime.parse(json['startDate']),
        active: json['state'],
        location: Locations.fromJson(json['location'][0]),
        trainerData: Trainer.fromJson(json['trainer'][0]),
        icon: serverStorage + json['TClogo']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'duration': duration,
        'image': image,
        'trainer': trainer,
        'TC': trainingCenterID,
        'periodsRepeats': periodsRepeats,
        'period': period,
        'description': description,
        'id': id,
        'TCname': trainingCenterName,
        'tags': tags,
        'price': price,
        'startDate': startingDate,
        'state': active,
        'location': location,
        'trainerData': trainerData,
        'icon': icon,
      };
}
