import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Widgets/CourseBox.dart';
import 'package:coursati/Widgets/TCBox.dart';
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

  List<BoxCourseLabelData> CourseBLD = [
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
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "الدورات التدريبية",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1776e0),
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

                      for (int i = 0; i < 4; i++)
                        CourseBox(
                          bld: CourseBLD[i],
                        ),

                      RoundedButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
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
              Divider(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "المراكز التدريبية",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Row(
                      children: [
                        //////////////////////////////////////////////////
                        ///
                        for (int i = 0; i < 4; i++)
                          TCBox(
                            bld: trainingCenterBLD[i],
                          ),

                        RoundedButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
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
