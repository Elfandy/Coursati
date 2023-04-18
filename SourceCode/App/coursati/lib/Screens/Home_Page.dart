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
    for (int i = 0; i < trainingCenterData.length; i++) {
      trainingCenterBLDSmall.add(BoxTCLabelData(
          address: trainingCenterData[i].location,
          id: trainingCenterData[i].id,
          image: trainingCenterData[i].image,
          logo: trainingCenterData[i].logo,
          name: trainingCenterData[i].name));
    }
    for (int i = 0; i < courseBLD.length; i++) {
      for (int j = 0; j < trainingCenterData.length; j++) {
        if (trainingCenterData[j].id == courseBLD[i].trainingCenterID) {
          courseBLDsmall.add(BoxCourseLabelData(
            location_in: (languageType == 0)
                ? trainingCenterData[j].location.city_ar
                : trainingCenterData[j].location.city_en,
            id: courseBLD[i].id,
            image: courseBLD[i].image,
            label: courseBLD[i].name,
          ));
        }
      }
    }
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
                            i <
                                ((courseBLDsmall.length < 7)
                                    ? courseBLDsmall.length
                                    : 7);
                            i++)
                          CourseBox(
                            bld: courseBLDsmall[i],
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
                                  ((trainingCenterBLDSmall.length < 7)
                                      ? trainingCenterBLDSmall.length
                                      : 7);
                              i++)
                            TCBox(
                              bld: trainingCenterBLDSmall[i],
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
      ),
    );
  }
}
