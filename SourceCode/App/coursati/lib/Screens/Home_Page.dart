import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Screens/SubScreen/ShowAllCourse.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Classes/BoxCourseLabelData.dart';
import '../Classes/GlobalVariables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //This is the stuff to work in the front end only no online connection needed here
  //////////////////////////////////////////////////////////////////////////
  ///
  ///

////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
/////////////////////////////////////////////////////////////////////
  ///
  ///

//? ------------------------------------------------------------------------------------------

  Future<List<BoxCourseLabelData>> fetchCourses() async {
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

  Future<List<BoxTCLabelData>> fetchTrainingCenter() async {
    var url = "TrainingCenter1";
    List<BoxTCLabelData> tC = [];

    try {
      var response = await dioTestApi.get(url);
      if (response.statusCode == 200) {
        List<dynamic> tCJson = response.data["TrainingCenter"];

        for (var tCJson in tCJson) {
          tC.add(BoxTCLabelData.fromJson(tCJson));
        }
      }
    } catch (e) {
      print(e);
    }
    return tC;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Align(
                alignment: (languageType == 0)
                    ? Alignment.topLeft
                    : Alignment.topRight,
                widthFactor: 5,
                heightFactor: 0.7,
                child: Image.asset(
                  (languageType == 0)
                      ? "Assets/Logo/MainLogoTilted-Right.png"
                      : "Assets/Logo/MainLogoTilted-left.png",
                  scale: 5,
                ),
              ),
              Align(
                alignment: (languageType == 0)
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        (languageType == 0)
                            ? "Assets/Icons/Coursati_arabic.png"
                            : "Assets/Logo/Coursati.png",
                        scale: 3,
                      ),
                    )
                  ],
                ),
              ),
            ]),
            ////////////////////////////////////////////////////////////////
            ///
            ///
            ///
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //* Popular Courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          (languageType == 0)
                              ? "الدورات الرائجة"
                              : "Popular Courses",
                          style: TextStyle(
                            shadows: const [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 2.2),
                                  blurRadius: 4)
                            ],
                            fontSize: (languageType == 0) ? 24 : 36,
                            // color: const Color(0xff1776e0),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(ScreenController()
                                  .createRoute(ShowCourses(), 1));
                            },
                            child: const Text(
                              "المزيد",
                              style: TextStyle(fontSize: 20),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ],
                ),
                FutureBuilder(
                  future: fetchCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<BoxCourseLabelData> _courses = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          itemCount:
                              (_courses.length > 7) ? 7 : _courses.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return CourseBox(
                              bld: BoxCourseLabelData(
                                  id: _courses[index].id,
                                  image: _courses[index].image,
                                  name: _courses[index].name,
                                  location_in: _courses[index].location_in),
                            );
                          }),
                        ),
                      );
                    } else {
                      return Container(
                          width: double.infinity,
                          height: 200,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
                //** New Courses */
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      (languageType == 0) ? "الدورات الجديدة" : "New Courses",
                      style: TextStyle(
                        shadows: const [
                          Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 2.2),
                              blurRadius: 4)
                        ],
                        fontSize: (languageType == 0) ? 24 : 36,
                        // color: const Color(0xff1776e0),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                FutureBuilder(
                  future: fetchCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<BoxCourseLabelData> _courses = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          itemCount:
                              (_courses.length > 7) ? 7 : _courses.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return CourseBox(
                              bld: BoxCourseLabelData(
                                  id: _courses[index].id,
                                  image: _courses[index].image,
                                  name: _courses[index].name,
                                  location_in: _courses[index].location_in),
                            );
                          }),
                        ),
                      );
                    } else {
                      return Container(
                          width: double.infinity,
                          height: 200,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    }
                  },
                ),

                //**  */
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (languageType == 0)
                            ? "المراكز التدريبية"
                            : "Training Centers",
                        style: TextStyle(
                          shadows: const [
                            Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 2.2),
                                blurRadius: 4)
                          ],
                          fontSize: (languageType == 0) ? 24 : 36,
                          // color: const Color(0xff1776e0),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  /////////////////////////////////////////////////////////
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///

                  FutureBuilder(
                      future: fetchTrainingCenter(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<BoxTCLabelData> _Tc = snapshot.data!;

                          return Container(
                            width: double.infinity,
                            height: 250,
                            child: ListView.builder(
                              itemCount: (_Tc.length > 7) ? 7 : _Tc.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return TCBox(
                                  bld: BoxTCLabelData(
                                    id: _Tc[index].id,
                                    image: _Tc[index].image,
                                    name: _Tc[index].name,
                                    logo: _Tc[index].logo,
                                  ),
                                );
                              }),
                            ),
                          );
                        } else {
                          return Container(
                              width: double.infinity,
                              height: 250,
                              child: const Center(
                                  child: CircularProgressIndicator()));
                        }
                      }),

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  //     child: Row(
                  //       children: [
                  //         //////////////////////////////////////////////////
                  //         ///
                  //         for (int i = 0;
                  //             i <
                  //                 ((trainingCenterBLDSmall.length < 7)
                  //                     ? trainingCenterBLDSmall.length
                  //                     : 7);
                  //             i++)
                  //           TCBox(
                  //             bld: trainingCenterBLDSmall[i],
                  //           ),

                  //         RoundedButton(
                  //           icon: Icon(
                  //             (languageType == 0)
                  //                 ? Icons.keyboard_arrow_left
                  //                 : Icons.keyboard_arrow_right,
                  //             size: 40,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             Navigator.of(context).push(
                  //               ScreenController()
                  //                   .createRoute(const ShowTC(), 3),
                  //             );
                  //           },
                  //           color: const Color(0xff1776e0),
                  //           size: 80,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ]
                    //////////////////////////////////////////////////////////////////////////////////
                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
