import 'Tag.dart';
import 'Trainer.dart';
import 'TrainingCenter.dart';

class Course {
  late int id, duration;
  late String name, description;
  late Tag tag;
  late double price, discount;
  late DateTime startingDate;
  late bool active;
  late Trainer trainer;
  late TrainingCenter trainingCenter;


  Course({
    required int id,
    required int duration,
    required String name,
    required Tag tag,
    required double price,
    required double discount,
    required DateTime startingDate,
    required bool active,
    required Trainer trainer,
    required TrainingCenter trainingCenter,
  });
}
