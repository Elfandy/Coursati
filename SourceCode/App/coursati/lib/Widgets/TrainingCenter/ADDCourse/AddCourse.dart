import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Widgets/TrainingCenter/ADDCourse/ContainerForCourse.dart';

import 'package:flutter/material.dart';

import '../../../Classes/Trainer.dart';

class AddCourse extends StatefulWidget {
  AddCourse({super.key, required this.trainingCenter, required this.trainers});
  TrainingCenter trainingCenter;
  List<TrainerData> trainers;
  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((languageType == 0) ? "إضافة دورة" : "Add Course"),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: 270,
            child: Image.asset(
              "Assets/Images/techny-artificial-intelligence-on-tablet-screen.gif",
              fit: BoxFit.contain,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: (languageType == 0) ? "اسم الدورة" : "Course Name",
              // labelStyle: TextStyle(color:)
            ),
          ),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
