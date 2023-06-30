import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/Course.dart';
import 'package:coursati/Classes/Trainer.dart';
import 'package:coursati/Classes/TrainingCenter.dart';

class AllTrainingCenterData {
  AllTrainingCenterData(
      {required this.tcData, required this.courses, required this.trainers});

  TrainingCenter? tcData;
  List<BoxCourseLabelData> courses = [];
  List<Trainer> trainers = [];

  factory AllTrainingCenterData.fromJson(Map<String, dynamic> json) {
    var courseObjJson = json["courses"] as List;
    List<BoxCourseLabelData> _courses = courseObjJson
        .map((courseJson) => BoxCourseLabelData.fromJson(courseJson))
        .toList();
    var trainerObjJson = json["trainers"] as List;
    List<Trainer> _trainers = trainerObjJson
        .map((trainerJson) => Trainer.fromJson(trainerJson))
        .toList();

    return AllTrainingCenterData(
        tcData: TrainingCenter.fromJson(json["mytc"][0]),
        courses: _courses,
        trainers: _trainers);
  }
}
