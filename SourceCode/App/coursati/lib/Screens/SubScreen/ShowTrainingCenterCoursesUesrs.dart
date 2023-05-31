import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

class ShowTCCourseUser extends StatefulWidget {
  const ShowTCCourseUser({super.key});

  @override
  State<ShowTCCourseUser> createState() => _ShowTCCourseUserState();
}

class _ShowTCCourseUserState extends State<ShowTCCourseUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((languageType == 0) ? "الدورات " : " Courses"),
      ),
    );
  }
}
