import 'package:flutter/material.dart';

import '../../Classes/Course.dart';
import '../../Classes/GlobalVariables.dart';

import '../../Classes/Trainer.dart';

class CourseDetailedPage extends StatefulWidget {
  const CourseDetailedPage({super.key, required this.name});
  final String name;

  @override
  State<CourseDetailedPage> createState() => _CourseDetailedPageState();
}

class _CourseDetailedPageState extends State<CourseDetailedPage> {
  Course? _course;

  Course? _temp;
  bool _found = false;

  @override
  Widget build(BuildContext context) {
    if ((_temp = getCourseData(widget.name)) != null) {
      _found = true;
      _course = _temp!;
    }

    if (_found) {
      return Scaffold();
    }
    return (Scaffold(
      body: Center(
        child: Text(
          "No Course",
          style: TextStyle(
              color: (isDark) ? Colors.white : Colors.black, fontSize: 32),
        ),
      ),
    ));
  }

  Course? getCourseData(String name) {
    for (int i = 0; i < courseBLD.length; i++) {
      if (name == courseBLD[i].name) {
        return courseBLD[i];
      }
    }
    return null;
  }
}
