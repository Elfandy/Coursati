import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Classes/BoxTCLabelData.dart';
import '../Classes/GlobalVariables.dart';
import '../Widgets/TrainingCenter/TCLoggedIn.dart';
import '../Widgets/TrainingCenter/TCNotLoggedIn.dart';

import 'SubScreen/TrainingCenterPersonalPage.dart';

class TrainingCenter extends StatefulWidget {
  const TrainingCenter({super.key});

  @override
  State<TrainingCenter> createState() => _TrainingCenterState();
}

class _TrainingCenterState extends State<TrainingCenter> {
//*********************************************************************************** */
  List<BoxTCLabelData> branchList = [];
  BoxTCLabelData trainingCenter =
      BoxTCLabelData(name: "", image: "", logo: "", id: "");
// late BoxTCLabelData trainingCenter ;

  //??????????????????????????????????????????????????????????????????????????????
  @override
  Widget build(BuildContext context) {
    //! this is for filling the Training center data

    if (user.token == "") {
      //! This is where the screen of user is not loged in
      return const TCNotLogged();
      // return const TCLoggedIn();
    }
    if (user.trainingCenterId == null) {
      //! THis is where the screen of user is loged in but doesnot have a training center
      return const TCLoggedIn();
    }
    return FutureBuilder(
        future: GetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              trainingCenter = BoxTCLabelData.fromJson(snapshot.data);
              return Scaffold(
                floatingActionButton: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, bottom: 15),
                      child: FloatingActionButton(
                        backgroundColor: Color(0xee1776e0),
                        heroTag: "add",
                        onPressed: () {},
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    )),
                body: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height),
                      child: Image.asset(
                        "Assets/Images/Background.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    (languageType == 0)
                                        ? "مركز التدريب"
                                        : "Training Center",
                                    style: const TextStyle(
                                        fontSize: 28, color: Color(0xff1776e0)),
                                  ),
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: trainingCenter.logo!,
                                          height: 120,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            " ${(languageType == 0) ? "مركز ${trainingCenter.name}" : "${trainingCenter.name} Center"}",
                                            style: const TextStyle(
                                              fontSize: 32,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: Text(
                                    (languageType == 0)
                                        ? "الفرع الرئيسي"
                                        : "Main Branch",
                                    style: const TextStyle(
                                        fontSize: 28, color: Color(0xff1776e0)),
                                  ),
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Center(
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff000000),
                                            Color(0x22ffffff),
                                            Color(0x00000000),
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              1.1),
                                      height: 180,
                                      child: InkWell(
                                        highlightColor: null,
                                        borderRadius: BorderRadius.circular(20),
                                        splashFactory: InkSparkle
                                            .constantTurbulenceSeedSplashFactory,
                                        onTap: () {
                                          Navigator.of(context).push(
                                              ScreenController().createRoute(
                                                  TrainingCenterPersonal(
                                                      id: trainingCenter.id!,
                                                      mainBranch: true),
                                                  1));
                                        },
                                        splashColor: const Color(0xdd1776e0),
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          value: progress
                                                              .progress)),
                                          imageUrl: trainingCenter.image!,
                                          imageBuilder:
                                              (context, imageProvider) => Ink(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: (languageType == 0)
                                                    ? Alignment.bottomRight
                                                    : Alignment.bottomLeft,
                                                child: Text(
                                                  trainingCenter.locName!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: (branchList.isEmpty)
                                      ? Container()
                                      : Text(
                                          (languageType == 0)
                                              ? "الفروع"
                                              : "Branches",
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Color(0xff1776e0)),
                                        ),
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: (branchList.isEmpty)
                                      ? Container()
                                      : Column(children: [
                                          for (int i = 0;
                                              i < branchList.length;
                                              i++)
                                            Center(
                                              child: Card(
                                                shape: BeveledRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                elevation: 10,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color(0xff000000),
                                                        Color(0x22ffffff),
                                                        Color(0x00000000),
                                                      ],
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      end: Alignment.topCenter,
                                                    ),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.1),
                                                  height: 180,
                                                  child: InkWell(
                                                    highlightColor: null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    splashFactory: InkSparkle
                                                        .constantTurbulenceSeedSplashFactory,
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          ScreenController().createRoute(
                                                              TrainingCenterPersonal(
                                                                  id: branchList[
                                                                          i]
                                                                      .id!,
                                                                  mainBranch:
                                                                      false),
                                                              1));
                                                    },
                                                    splashColor:
                                                        const Color(0xdd1776e0),
                                                    child: CachedNetworkImage(
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      progressIndicatorBuilder: (context,
                                                              url, progress) =>
                                                          Center(
                                                              child: CircularProgressIndicator(
                                                                  value: progress
                                                                      .progress)),
                                                      imageUrl:
                                                          branchList[i].image!,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Ink(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Align(
                                                            alignment: (languageType ==
                                                                    0)
                                                                ? Alignment
                                                                    .bottomRight
                                                                : Alignment
                                                                    .bottomLeft,
                                                            child: Text(
                                                              branchList[i]
                                                                  .locName!,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 28,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ]),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: Text("Your request took to long"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future GetData() async {
    var url = "/user/TrainingCenter";

    try {
      branchList.clear();
      var response = await dioTestApi.post(url, data: {"id": user.id});
      if (response.statusCode == 200) {
        List branchJson = response.data["Branches"];
        Map<String, dynamic> trainingCenterjson =
            response.data["TrainingCenter"];

        for (var branchJson in branchJson) {
          branchList.add(BoxTCLabelData.fromJson(branchJson));
        }

        return trainingCenterjson;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
