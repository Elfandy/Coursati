import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Widgets/TrainingCenter/ADDCourse/AddCourse.dart';
import 'package:flutter/material.dart';

class ContainerForCourse extends StatefulWidget {
  ContainerForCourse({super.key, required this.trainingCenter});
  TrainingCenter trainingCenter;
  @override
  State<ContainerForCourse> createState() => _ContainerForCourseState();
}

class _ContainerForCourseState extends State<ContainerForCourse> {
  List<TrainerData> trainers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getTeachers(int.parse(widget.trainingCenter.id)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AddCourse(
              trainingCenter: widget.trainingCenter,
              trainers: trainers,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future getTeachers(int trainingCenterID) async {
    var url = "trainers";
    trainers.clear();
    try {
      var response = await dioTestApi.post(url, data: {"tc": trainingCenterID});
      if (response.statusCode == 200) {
        for (var item in response.data) {
          trainers.add(TrainerData.fromJson(item));
        }

        return true;
      }
    } catch (ex) {
      print(ex);
    }
  }
}

class TrainerData {
  TrainerData({required this.id, required this.name});
  String id, name;
  TrainerData.fromJson(Map<String, dynamic> json)
      : id = json["id"].toString(),
        name = json["name"];

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
