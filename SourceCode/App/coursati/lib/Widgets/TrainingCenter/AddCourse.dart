import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/Course.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  AddCourse({super.key, required this.trainingCenter});
  TrainingCenter trainingCenter;
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
        children: [],
      ),
    );
  }

  Future getTeachers(int trainingCenterID) async {
    var url = "TeacherData";

    try {
      var response = await dioTestApi.post(url, data: {"id": trainingCenterID});
    } catch (ex) {}
  }
}
