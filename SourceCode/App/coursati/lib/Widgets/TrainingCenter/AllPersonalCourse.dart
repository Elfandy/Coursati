import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/Course.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/AllCoursesShowWithSearch.dart';
import 'package:coursati/Widgets/TrainingCenter/AllCoursesShowWithSearchPersonal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AllPersonalCourse extends StatefulWidget {
  AllPersonalCourse({super.key, required this.courses});
  List<BoxCourseLabelData> courses;

  @override
  State<AllPersonalCourse> createState() => _AllPersonalCourseState();
}

class _AllPersonalCourseState extends State<AllPersonalCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        elevation: 2,
        title: Text((languageType == 0) ? "الدورات" : "Courses",
            style: TextStyle(
                color: (isDark) ? const Color(0xff1776e0) : Colors.black)),
        backgroundColor: (isDark) ? const Color(0xff424242) : Colors.white,
      ),
      body: AllCoursesShowWithSearchPersonal(
        courses: widget.courses,
      ),
    );
  }

  // Future<List<BoxCourseLabelData>> getData(String id) async {
  //   var url = "";
  //   List<BoxCourseLabelData> courses = [];
  //   try {
  //     var response = await dioTestApi.post(url, data: {"tcID": id});

  //     if (response.statusCode == 200) {
  //       List<dynamic> coursesJson = response.data["courses"];

  //       for (var coursesJson in coursesJson) {
  //         courses.add(BoxCourseLabelData.fromJson(coursesJson));
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //   return courses;
  // }
}
