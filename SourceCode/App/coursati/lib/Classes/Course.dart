import 'GlobalVariables.dart';
import 'Location.dart';
import 'TagData.dart';
import 'Trainer.dart';
import 'TrainingCenter.dart';

// class CourseFields {
//   static final String id = "_id";
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
    required this.tags,
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
  final int id, duration, trainer, trainingCenterID;
  int? periodsRepeats, period;
  final String name, description, image, icon, trainingCenterName;
  final List<Tag> tags;
  final double price, discount;
  final DateTime startingDate;
  final bool active, full, repeats;
  final Location location;
  final Trainer trainerData;
}
