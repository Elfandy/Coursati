import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/AllCoursesShowWithSearch.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/BoxCourseLabelData.dart';

class ShowCourses extends StatefulWidget {
  const ShowCourses({super.key});

  @override
  State<ShowCourses> createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
          elevation: 2,
          title: Text((languageType == 0) ? "الدورات" : "Courses",
              style: TextStyle(color: (isDark) ? Colors.white : Colors.black)),
          backgroundColor: (isDark) ? Color(0xff424242) : Colors.white,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<BoxCourseLabelData> courses = snapshot.data!;
              return AllCoursesShowWithSearch(
                courses: courses,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Future<List<BoxCourseLabelData>> getData() async {
    var url = "Course1";
    List<BoxCourseLabelData> courses = [];
    try {
      var response = await dioTestApi.get(url);

      if (response.statusCode == 200) {
        List<dynamic> coursesJson = response.data["course"];

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
