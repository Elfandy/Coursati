import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/AllCoursesShowWithSearch.dart';
import 'package:coursati/Widgets/Home/AllTCShowwithSearch.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/BoxCourseLabelData.dart';

class ShowTC extends StatefulWidget {
  const ShowTC({super.key});

  @override
  State<ShowTC> createState() => _ShowTCState();
}

class _ShowTCState extends State<ShowTC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
          elevation: 2,
          title: Text((languageType == 0) ? "الدورات" : "Courses",
              style: TextStyle(color: (isDark) ? Colors.white : Colors.black)),
          backgroundColor: (isDark) ? Color(0xff424242) : Colors.white,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<BoxTCLabelData> trainingCenter = snapshot.data!;
              return AllTCShowWithSearch(
                trainingCenter: trainingCenter,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Future<List<BoxTCLabelData>> getData() async {
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
}
