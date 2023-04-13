import 'package:coursati/Widgets/CourseBox.dart';
import 'package:flutter/material.dart';

import '../Classes/BoxCourseLabelData.dart';
import '../Widgets/RoundedButton.dart';

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

  List<String> coursesImages = [
    "https://images.unsplash.com/photo-1516321497487-e288fb19713f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1508830524289-0adcbe822b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=825&q=80",
    "https://images.unsplash.com/photo-1542744094-24638eff58bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1565106430482-8f6e74349ca1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODN8fGNvdXJzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  ];

  List<BoxCourseLabelData> blds = [
    BoxCourseLabelData(
      label: "البرمجة باستخدام لغة الجافا",
      In: "Octal",
    ),
    BoxCourseLabelData(
      label: "تحليل البرمجيات الخبيثة",
      In: "Octal",
    ),
    BoxCourseLabelData(
      label: "إدارة الوقت",
      In: "Gama",
    ),
    BoxCourseLabelData(
      label: "هجمات الأندرويد",
      In: "Lablas",
    ),
  ];

////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
/////////////////////////////////////////////////////////////////////
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              widthFactor: 5,
              heightFactor: 0.7,
              child: Image.asset(
                "Assets/Logo/MainLogoTilted-Right.png",
                scale: 5,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: 200,
                  ),
                  Image.asset(
                    "Assets/Logo/Coursati.png",
                    scale: 3,
                  )
                ],
              ),
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "الدورات التدريبية",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    //////////////////////////////////////////////////////////////
                    ///
                    ///
                    ///
                    ///
                    CourseBox(
                      image: coursesImages[0],
                      bld: blds[0],
                    ),
                    CourseBox(
                      image: coursesImages[1],
                      bld: blds[1],
                    ),
                    CourseBox(
                      image: coursesImages[2],
                      bld: blds[2],
                    ),
                    CourseBox(
                      image: coursesImages[3],
                      bld: blds[3],
                    ),
                    RoundedButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 40,
                      ),
                      onPressed: () => {},
                      color: const Color(0xffdddddd),
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
            
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "الدورات التدريبية",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    //////////////////////////////////////////////////////////////
                    ///
                    ///
                    ///
                    ///
                    CourseBox(
                      image: coursesImages[0],
                      bld: blds[0],
                    ),
                    CourseBox(
                      image: coursesImages[1],
                      bld: blds[1],
                    ),
                    CourseBox(
                      image: coursesImages[2],
                      bld: blds[2],
                    ),
                    CourseBox(
                      image: coursesImages[3],
                      bld: blds[3],
                    ),
                    RoundedButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 40,
                      ),
                      onPressed: () => {},
                      color: const Color(0xffdddddd),
                      size: 80,
                    ),
             
                  ],
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
    );
  }
}
