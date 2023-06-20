import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/Trainer.dart';
import 'package:coursati/Widgets/TrainingCenter/TrainerDetiled/TrainerDetailedInfo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TrainerDetailedFetchData extends StatefulWidget {
  TrainerDetailedFetchData({super.key, required this.id});
  String id;
  @override
  State<TrainerDetailedFetchData> createState() =>
      _TrainerDetailedFetchDataState();
}

class _TrainerDetailedFetchDataState extends State<TrainerDetailedFetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchTrainerData(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Trainer trainer = Trainer.fromJson(snapshot.data);
            return TrainerDetailedInfo(
              trainer: trainer,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future fetchTrainerData(String id) async {
    var url = "Trainer";
    try {
      FormData form = FormData.fromMap({'id': id});
      var response = await dioTestApi.post(url, data: form);
      if (response.statusCode == 200) {
        if (response.data != 'failed') {
          return response.data;
        }
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      } else {
        Fluttertoast.showToast(msg: ex.toString());
      }
    }
  }
}
