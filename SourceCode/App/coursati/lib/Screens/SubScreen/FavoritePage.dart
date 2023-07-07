import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<BoxTCLabelData> trainingCenters = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "المفضلة" : "Favorite",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: FutureBuilder(
          future: favorite(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (trainingCenters.isNotEmpty) {
                return SingleChildScrollView(
                  child: Wrap(
                    children: [for (var tc in trainingCenters) TCBox(bld: tc)],
                  ),
                );
              } else {
                return Center(
                  child: Column(children: [
                    Text("You didnt follow any Training centers yet")
                  ]),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future favorite() async {
    var url = 'myfav';
    try {
      trainingCenters.clear();
      var response = await dioTestApi.post(url, data: {'userID': user.id});
      if (response.statusCode == 200) {
        for (var value in response.data) {
          trainingCenters.add(BoxTCLabelData.fromJson(value));
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}
