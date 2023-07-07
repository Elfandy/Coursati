import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/TCBranch.dart';
import 'package:coursati/Screens/SubScreen/MapScreenTC.dart';
import 'package:coursati/Screens/SubScreen/TrainingCenterInfo/TrainingCenterInfoPageData.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Classes/GlobalVariables.dart';

import '../../../Classes/TrainingCenter.dart';
import '../CoursesViewPage.dart';

class TrainingCenterPage extends StatefulWidget {
  const TrainingCenterPage({super.key, required this.id, required this.loc});
  final String id;
  final bool loc;

  @override
  State<TrainingCenterPage> createState() => _TrainingCenterPageState();
}

class _TrainingCenterPageState extends State<TrainingCenterPage> {
  int following = 0, canRate = 0, branchedto = 0;
  List<TcBranch> branches = [];
  //*************************************************************************** */
  @override
  Widget build(BuildContext context) {
//! This is for the repeated widgets

    //??????????????????????????????????????????????????????????????????????????????????

    //************************************************************************* */

    return Scaffold(
        body: FutureBuilder(
      future: getTCData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          TrainingCenter trainingCenter = snapshot.data!;
          return TrainingCenterInfo(
            branchedto: branchedto,
            branches: branches,
            canRate: canRate,
            following: following,
            loc: widget.loc,
            trainingCenter: trainingCenter,
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

  Future<TrainingCenter> getTCData(String id) async {
    var url = "TrainingCenterInfo";
    TrainingCenter trainingCenter = TrainingCenter(
      // branch: null,
      close: const TimeOfDay(hour: 0, minute: 0),
      description: """""",
      email: "",
      id: "0",
      location: locations[0],
      name: "",
      open: const TimeOfDay(hour: 0, minute: 0),
      phoneNumber: "",
      rating: 0.0,
      tags: [],
      image: "",
      logo: "",
    );

    try {
      Map<String, dynamic> data =
          user.id != 0 ? {"id": id, 'userID': user.id} : {"id": id};
      var response = await dioTestApi.post(url, data: data);
      if (response.statusCode == 200) {
        trainingCenter = TrainingCenter.fromJson(response.data['info']);

        following = response.data['info']['follow'] == 'no'
            ? 1
            : response.data['info']['follow'] == 'yes'
                ? 2
                : 0;
        canRate = response.data['info']['follow'] == 'login'
            ? 0
            : response.data['info']['allowtorate'] == 'yes'
                ? 1
                : 2;
        branches.clear();
        branchedto = response.data['info']['branched_to'] != null ? 0 : 1;
        for (var value in response.data['tcBranch'])
          branches.add(TcBranch.fromJson(value));
      }
    } catch (e) {
      print(e);
    }
    return trainingCenter;
  }
  // TrainingCenter? getTCData(String name) {
  //   for (int i = 0; i < trainingCenterData.length; i++) {
  //     if (name == trainingCenterData[i].name) {
  //       return trainingCenterData[i];
  //     }
  //   }
  //   return null;
  // }
}
