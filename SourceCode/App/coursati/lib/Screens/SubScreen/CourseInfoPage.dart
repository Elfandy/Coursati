import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Classes/Course.dart';
import '../../Classes/GlobalVariables.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage({super.key, required this.name});
  final String name;

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  Course _course = Course(
    name: "",
    trainingCenter: 0,
    image: "",
    id: 0,
    active: false,
    description: """""",
    discount: 0,
    duration: 0,
    full: false,
    price: 0,
    startingDate: DateTime(2023),
    tags: [],
    trainer: 0,
  );

  Course? _temp;

  bool _found = false, _isEven = false;
  @override
  Widget build(BuildContext context) {
    if ((_temp = getCourseData(widget.name)) != null) {
      _found = true;
      _course = _temp!;
    }

    if (_found) {
      return Scaffold(
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(children: [
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //? This is the image code
                Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: CachedNetworkImageProvider(
                        _course.image,
                      ),
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                ),
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                Padding(
                    padding: const EdgeInsets.only(top: 270),
                    child: Container(
                        decoration: BoxDecoration(
                            color: (isDark!) ? Colors.grey[800] : Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 30, 20, 0),
                                    child: TextButton(
                                      onPressed: () async {
                                        await Clipboard.setData(
                                            ClipboardData(text: _course.name));
                                        Fluttertoast.showToast(
                                            msg:
                                                "${_course.name} copyed to clipboard",
                                            backgroundColor: Color(0xff999999),
                                            gravity: ToastGravity.BOTTOM);
                                      },
                                      child: Text(
                                        (" ${_course.name}"),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff1776e0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ])))
              ])));
    }
    return (Scaffold(
      body: Center(
        child: Text(
          "No Course",
          style: TextStyle(
              color: (isDark!) ? Colors.white : Colors.black, fontSize: 32),
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
