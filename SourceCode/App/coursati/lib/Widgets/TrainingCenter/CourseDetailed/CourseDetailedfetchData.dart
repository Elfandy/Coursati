import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Widgets/TrainingCenter/CourseDetailed/CourseDetailedInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../Classes/Course.dart';
import '../../../Classes/GlobalVariables.dart';
import '../../../Classes/TagData.dart';
import '../../../Classes/Trainer.dart';
import '../../CustomeWidgets/TagChip.dart';

class CourseDetailedfetchData extends StatefulWidget {
  const CourseDetailedfetchData(
      {super.key, required this.id, required this.trainers});
  final String id;
  final List<BLDTrainer> trainers;

  @override
  State<CourseDetailedfetchData> createState() =>
      _CourseDetailedfetchDataState();
}

class _CourseDetailedfetchDataState extends State<CourseDetailedfetchData> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getCourseData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Course _course = snapshot.data!;

          return CourseDetailedInfo(
            trainers: widget.trainers,
            course: _course,
          );
        } else {
          return Container(
              width: double.infinity,
              height: 250,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    ));
  }

  Future<Course> getCourseData(String id) async {
    var url = "CourseInfo";
    Map<String, dynamic> course = {"id": id};
    Course _course = Course(
      name: "",
      trainingCenterID: "0",
      image: "",
      id: '',
      active: 0,
      description: """""",
      discount: 0,
      duration: 0,
      full: false,
      price: 0,
      startingDate: DateTime(2023),
      tags: [],
      trainer: "0",
      icon: "",
      location: locations[0],
      repeats: false,
      trainerData: Trainer(
        id: "0",
        discription: """""",
        image: "",
        major: "",
        name: "",
      ),
    );

    try {
      var response = await dioTestApi.post(url, data: course);
      if (response.statusCode == 200) {
        _course = Course.fromJson(response.data['info'][0]);
      }
    } catch (e) {
      print(e);
    }

    return _course;
  }
}
