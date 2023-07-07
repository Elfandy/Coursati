import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
// import 'package:coursati/Widgets/TrainingCenter/CourseBox.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class CoursesViewPage extends StatefulWidget {
  CoursesViewPage({super.key, required this.id});
  String id;

  @override
  State<CoursesViewPage> createState() => _CoursesViewPageState();
}

class _CoursesViewPageState extends State<CoursesViewPage> {
  List<BoxCourseLabelData> courses = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: getCourses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Center(
                    child: Wrap(
                      children: [
                        for (BoxCourseLabelData value in courses)
                          CourseBox(bld: value),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future getCourses() async {
    var url = "tc/mycourses";
    try {
      courses.clear();
      var response = await dioTestApi.post(url, data: {'tcID': widget.id});
      if (response.statusCode == 200) {
        print(response.data);
        for (var element in response.data['mycourses']) {
          courses.add(BoxCourseLabelData.fromJson(element));
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}
