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
    required this.discount,
    required this.startingDate,
    required this.active,
    required this.trainer,
    required this.trainingCenterID,
    required this.description,
    required this.full,
    required this.image,
    required this.location,
    this.icon = "",
    this.trainingCenterName = "",
    this.periodsRepeats,
    required this.repeats,
    required this.trainerData,
    this.period,
  });
  final int duration;
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
  final bool active, full, repeats;
  final Locations location;
  final Trainer trainerData;

  factory Course.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['tags'] as List;
    List<Tag> _tags =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    return Course(
        name: json['name'],
        duration: json['duration'],
        image: serverStorage + json['image'],
        trainer: json['trainer'],
        trainingCenterID: json['trainingCenterID'].toString(),
        periodsRepeats: json['periodsRepeats'],
        period: json['period'],
        description: json['description'],
        id: json['id'].toString(),
        trainingCenterName: json['trainingCenterName'],
        tags: _tags,
        price: json['price'],
        discount: json['discount'],
        startingDate: DateTime.parse(json['startingDate']),
        active: json['active'],
        full: json['full'],
        repeats: json['repeats'],
        location: Locations.fromJson(json['location']),
        trainerData: Trainer.fromJson(json['trainerData']),
        icon: serverStorage + json['icon']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'duration': duration,
        'image': image,
        'trainer': trainer,
        'trainingCenterID': trainingCenterID,
        'periodsRepeats': periodsRepeats,
        'period': period,
        'description': description,
        'id': id,
        'trainingCenterName': trainingCenterName,
        'tags': tags,
        'price': price,
        'discount': discount,
        'startingDate': startingDate,
        'active': active,
        'full': full,
        'repeats': repeats,
        'location': location,
        'trainerData': trainerData,
        'icon': icon,
      };
}
