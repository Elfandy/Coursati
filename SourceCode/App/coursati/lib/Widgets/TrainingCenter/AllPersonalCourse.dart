import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/AllCoursesShowWithSearch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AllPersonalCourse extends StatefulWidget {
  AllPersonalCourse({super.key, required this.tcID});
  String tcID;

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
        body: FutureBuilder(
          future: getData(widget.tcID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<BoxCourseLabelData> courses = snapshot.data!;
              return AllCoursesShowWithSearch(
                courses: courses,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Future<List<BoxCourseLabelData>> getData(String id) async {
    var url = "/AllPersonalCourse";
    List<BoxCourseLabelData> courses = [];
    try {
      var response = await dioTestApi.post(url, data: {"tcID": id});

      if (response.statusCode == 200) {
        List<dynamic> coursesJson = response.data["courses"];

        for (var coursesJson in coursesJson) {
          courses.add(BoxCourseLabelData.fromJson(coursesJson));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return courses;
  }
}
