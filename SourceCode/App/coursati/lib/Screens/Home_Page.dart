import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/Ads.dart';
import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Screens/SubScreen/ShowAllCoursePersonal.dart';
import 'package:coursati/Screens/main_page.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:coursati/Widgets/Home/AdsPage.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/RoundedButton.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Classes/BoxCourseLabelData.dart';
import '../Classes/GlobalVariables.dart';
import 'SubScreen/ShowAllTC.dart';

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

  // Future<List<BoxCourseLabelData>> fetchCourses() async {
  //   var url = "/Course1";
  //   List<BoxCourseLabelData> courses = [];
  //   try {
  //     var response = await dioTestApi.get(url);

  //     if (response.statusCode == 200) {
  //       List<dynamic> coursesJson = response.data['courses'];

  //       for (var coursesJson in coursesJson) {
  //         courses.add(BoxCourseLabelData.fromJson(coursesJson));
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("courses error");
  //       print(e);
  //     }
  //   }
  //   return courses;
  // }

  Future<List<BoxCourseLabelData>> fetchCourses() async {
    var url = "Courses/NewCourses";
    List<BoxCourseLabelData> courses = [];
    try {
      var response = await dioTestApi.get(url);

      if (response.statusCode == 200) {
        List<dynamic> coursesJson = response.data['courses'];

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

  // Future<List<BoxTCLabelData>> fetchTrainingCenter() async {
  //   var url = "/TrainingCenter1";
  //   List<BoxTCLabelData> tC = [];

  //   try {
  //     var response = await dioTestApi.get(url);
  //     if (response.statusCode == 200) {
  //       List<dynamic> tCJson = response.data["tc"];

  //       for (var tCJson in tCJson) {
  //         tC.add(BoxTCLabelData.fromJson(tCJson));
  //       }
  //     }
  //   } catch (e) {
  //     print("trainingcenter error");
  //     print(e);
  //   }
  //   return tC;
  // }

  Future fetch_Data_from_server() async {}

  Future<List<BoxTCLabelData>> fetchTrainingCenter() async {
    var url = "/TrainingCenters";
    List<BoxTCLabelData> tC = [];

    try {
      var response = await dioTestApi.get(url);
      if (response.statusCode == 200) {
        List<dynamic> tCJson = response.data["tc"];

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
  void initState() {
    super.initState();

    fillTags();
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "adsHero",
                      child: FutureBuilder(
                        future: getAds(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data != null) {
                              List<Ads> ads = [];
                              for (var ad in snapshot.data) {
                                ads.add(Ads.fromJson(ad));
                              }
                              return ImageSlideshow(
                                  isLoop: true,
                                  indicatorColor: Color(0xff1776e0),
                                  initialPage: 1,
                                  autoPlayInterval: 5000,
                                  children: [
                                    for (int i = 0; i < ads.length; i++)
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  AdsPage(ad: ads[i]),
                                            ));
                                          },
                                          child: Stack(children: [
                                            CachedNetworkImage(
                                                imageUrl: ads[i].image,
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                fit: BoxFit.cover,
                                                width: double.infinity),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 20),
                                                  child: Stack(children: [
                                                    Text(
                                                      ads[i].title,
                                                      softWrap: true,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textWidthBasis:
                                                          TextWidthBasis
                                                              .longestLine,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // color: Colors.white,
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..color = Colors.black
                                                          ..strokeWidth = 2,
                                                        // color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      ads[i].title,
                                                      softWrap: true,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textWidthBasis:
                                                          TextWidthBasis
                                                              .longestLine,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ),
                                      ),
                                    //     OutlinedButton(

                                    //         style: OutlinedButton.styleFrom(
                                    //           shape: ContinuousRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(50),
                                    //           ),

                                    //         ),
                                    //         onPressed: () {},
                                    //         child: Stack(
                                    //           fit: StackFit.expand,
                                    //           children: [
                                    //             Padding(
                                    //               padding:
                                    //                   const EdgeInsets.symmetric(
                                    //                       horizontal: 10,
                                    //                       vertical: 20),
                                    //               child: Container(
                                    //                 width: MediaQuery.of(context)
                                    //                         .size
                                    //                         .width /
                                    //                     1.4,
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius:
                                    //                         BorderRadius.circular(
                                    //                             50)),
                                    //                 child: Stack(children: [
                                    //                   Text(
                                    //                     ads[i].title,
                                    //                     softWrap: true,
                                    //                     maxLines: 1,
                                    //                     overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                     textWidthBasis:
                                    //                         TextWidthBasis
                                    //                             .longestLine,
                                    //                     textAlign:
                                    //                         TextAlign.start,
                                    //                     style: TextStyle(
                                    //                       fontWeight:
                                    //                           FontWeight.bold,
                                    //                       // color: Colors.white,
                                    //                       foreground: Paint()
                                    //                         ..style =
                                    //                             PaintingStyle
                                    //                                 .stroke
                                    //                         ..color = Colors.black
                                    //                         ..strokeWidth = 2,
                                    //                       // color: Colors.white,
                                    //                       fontSize: 20,
                                    //                     ),
                                    //                   ),
                                    //                   Text(
                                    //                     ads[i].title,
                                    //                     softWrap: true,
                                    //                     maxLines: 1,
                                    //                     overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                     textWidthBasis:
                                    //                         TextWidthBasis
                                    //                             .longestLine,
                                    //                     textAlign:
                                    //                         TextAlign.start,
                                    //                     style: TextStyle(
                                    //                       fontWeight:
                                    //                           FontWeight.bold,
                                    //                       color: Colors.white,
                                    //                       fontSize: 20,
                                    //                     ),
                                    //                   )
                                    //                 ]),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ))
                                  ]);
                            } else {
                              return Center(
                                child: Text(
                                  languageType == 0
                                      ? "يبدو انه يوجد خطاء في الاتصال بالخادم الرجاء المحاولة لاحقا."
                                      : "There seems That There is a problem Connecting to the server Please try again later.",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),

                //* Popular Courses
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           (languageType == 0) ? "الدورات التدريبية" : "Courses",
                //           style: TextStyle(
                //             shadows: const [
                //               Shadow(
                //                   color: Colors.black45,
                //                   offset: Offset(1, 2.2),
                //                   blurRadius: 4)
                //             ],
                //             fontSize: (languageType == 0) ? 24 : 36,
                //             // color: const Color(0xff1776e0),
                //           ),
                //           textAlign: TextAlign.start,
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         TextButton(
                //             onPressed: () {
                //               Navigator.of(context).push(ScreenController()
                //                   .createRoute(ShowCourses(), 1));
                //             },
                //             child: const Text(
                //               "المزيد",
                //               style: TextStyle(fontSize: 20),
                //             )),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //       ],
                //     )
                //   ],
                // ),
                // FutureBuilder(
                //   future: fetchCourses(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       List<BoxCourseLabelData> _courses = snapshot.data!;

                //       return Container(
                //         width: double.infinity,
                //         height: 200,
                //         child: ListView.builder(
                //           itemCount:
                //               (_courses.length > 7) ? 7 : _courses.length,
                //           scrollDirection: Axis.horizontal,
                //           shrinkWrap: true,
                //           itemBuilder: ((context, index) {
                //             return CourseBox(
                //               bld: BoxCourseLabelData(
                //                   id: _courses[index].id,
                //                   image: _courses[index].image,
                //                   name: _courses[index].name,
                //                   location_in: _courses[index].location_in),
                //             );
                //           }),
                //         ),
                //       );
                //     } else {
                //       return Container(
                //           width: double.infinity,
                //           height: 200,
                //           child:
                //               const Center(child: CircularProgressIndicator()));
                //     }
                //   },
                // ),
                //** New Courses */
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
                              ? "الدورات الجديدة"
                              : "New Courses",
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
                            child: Text(
                              languageType == 0 ? "المزيد" : "More",
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

                //**  */
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                ? "المراكز التدريبية"
                                : "TrainingCenter",
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
                                    .createRoute(ShowTC(), 1));
                              },
                              child: Text(
                                languageType == 0 ? "المزيد" : "More",
                                style: TextStyle(fontSize: 20),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
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
                            height: 200,
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
                                      locName: _Tc[index].locName),
                                );
                              }),
                            ),
                          );
                        } else {
                          return Container(
                              width: double.infinity,
                              height: 200,
                              child: const Center(
                                  child: CircularProgressIndicator()));
                        }
                      }),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                        children: [
                          //////////////////////////////////////////////////
                          ///
                          for (int i = 0;
                              i <
                                  ((trainingCenterBLDSmall.length < 7)
                                      ? trainingCenterBLDSmall.length
                                      : 7);
                              i++)
                            TCBox(
                              bld: trainingCenterBLDSmall[i],
                            ),
                        ],
                      ),
                    ),
                  ),
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

  Future getAds() async {
    var url = "latestads";

    try {
      var response = await dioTestApi.get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    }
  }
}
