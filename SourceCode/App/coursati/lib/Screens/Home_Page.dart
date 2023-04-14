import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/material.dart';

import '../Classes/BoxCourseLabelData.dart';
import '../Widgets/Home/RoundedButton.dart';
import 'package:coursati/main.dart';

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

  List<BoxCourseLabelData> courseBLD = [
    BoxCourseLabelData(
      label: "البرمجة باستخدام لغة الجافا",
      In: "Octal",
      image:
          "http://192.168.43.126/Images/yustinus-tjiuwanda-BCBGahg0MH0-unsplash.jpg",
    ),
    BoxCourseLabelData(
      label: "تحليل البرمجيات الخبيثة",
      In: "Octal",
      image:
          "http://192.168.43.126/Images/XD_Slipcy_mobile_device_breaking_from_virus_blue_4k_04db82b1-9fc8-422b-ac2b-8f31cccbf54d.png",
    ),
    BoxCourseLabelData(
      label: "إدارة الوقت",
      In: "Gama",
      image:
          "http://192.168.43.126/Images/kelly-sikkema-io0ZLYbu31s-unsplash.jpg",
    ),
    BoxCourseLabelData(
      label: "هجمات الأندرويد",
      In: "Lablas",
      image:
          "http://192.168.43.126/Images/XD_Slipcy_mobile_device_cyber_attacks_blue_bfdc907f-2c89-48ae-9f83-4a3ec69de897.png",
    ),
  ];

  List<BoxTCLabelData> trainingCenterBLD = [
    BoxTCLabelData(
      label: "Octal",
      address: "حي الأندلس",
      logo: "http://192.168.43.126/Images/Asset%201%20(2).png",
      image: "http://192.168.43.126/Images/all-bong-L2oedF1AsH8-unsplash.jpg",
    ),
    BoxTCLabelData(
      label: "Gama",
      address: "حي الأندلس",
      logo: "http://192.168.43.126/Images/Asset%201.png",
      image:
          "http://192.168.43.126/Images/quentin-basnier-bFpbKy69zdc-unsplash.jpg",
    ),
    BoxTCLabelData(
      label: "Beta",
      address: "غوط الشعال",
      logo: "http://192.168.43.126/Images/Asset%202.png",
      image:
          "http://192.168.43.126/Images/marc-olivier-jodoin--HIiNFXcbtQ-unsplash.jpg",
    ),
    BoxTCLabelData(
      label: "Lablas",
      address: "جنزور",
      logo: "http://192.168.43.126/Images/Asset%203.png",
      image:
          "http://192.168.43.126/Images/lucas-franco-aRTjFXs6HNc-unsplash.jpg",
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
          ////////////////////////////////////////////////////////////////
          ///
          ///
          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    (languageType == 0) ? "الدورات التدريبية" : "Courses",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 2.2),
                            blurRadius: 4)
                      ],
                      fontSize: (languageType == 0) ? 24 : 36,
                      color: Color(0xff1776e0),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    children: [
                      //////////////////////////////////////////////////////////////
                      ///
                      ///
                      ///
                      ///
                      ///

                      for (int i = 0; i < courseBLD.length; i++)
                        CourseBox(
                          bld: courseBLD[i],
                        ),

                      RoundedButton(
                        icon: Icon(
                          (languageType == 0)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                          size: 40,
                        ),
                        onPressed: () => {},
                        color: const Color(0xff1776e0),
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
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      (languageType == 0)
                          ? "المراكز التدريبية"
                          : "Training Centers",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 2.2),
                              blurRadius: 4)
                        ],
                        fontSize: (languageType == 0) ? 24 : 36,
                        color: Color(0xff1776e0),
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
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Row(
                      children: [
                        //////////////////////////////////////////////////
                        ///
                        for (int i = 0; i < trainingCenterBLD.length; i++)
                          TCBox(
                            bld: trainingCenterBLD[i],
                          ),

                        RoundedButton(
                          icon: Icon(
                            (languageType == 0)
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
                            size: 40,
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
