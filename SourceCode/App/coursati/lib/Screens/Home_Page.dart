import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/material.dart';
import '../Classes/BoxCourseLabelData.dart';
import '../Classes/GlobalVariables.dart';
import '../Widgets/Home/RoundedButton.dart';

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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Align(
              alignment:
                  (languageType == 0) ? Alignment.topLeft : Alignment.topRight,
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
              alignment:
                  (languageType == 0) ? Alignment.topRight : Alignment.topLeft,
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
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    (languageType == 0) ? "الدورات التدريبية" : "Courses",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    children: [
                      //////////////////////////////////////////////////////////////
                      ///
                      ///
                      ///
                      ///
                      ///

                      for (int i = 0;
                          i < ((courseBLD.length < 7) ? courseBLD.length : 7);
                          i++)
                        CourseBox(
                          bld: courseBLD[i],
                        ),

                      RoundedButton(
                        icon: Icon(
                          (languageType == 0)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () => {},
                        size: 80,
                      ),
                      /////////////////////////////////////////////////////////
                      ///
                      ///
                      ///
                      ///
                    ],
                  ),
                ),
              ),
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
                                ((trainingCenterBLD.length < 7)
                                    ? trainingCenterBLD.length
                                    : 7);
                            i++)
                          TCBox(
                            bld: trainingCenterBLD[i],
                          ),

                        RoundedButton(
                          icon: Icon(
                            (languageType == 0)
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () => {},
                          color: const Color(0xff1776e0),
                          size: 80,
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
    );
  }
}
