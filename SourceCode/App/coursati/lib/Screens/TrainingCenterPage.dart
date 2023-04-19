import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Classes/GlobalVariables.dart';
import '../Widgets/TrainingCenter/TCLoggedIn.dart';
import '../Widgets/TrainingCenter/TCNotLoggedIn.dart';

class TrainingCenter extends StatefulWidget {
  const TrainingCenter({super.key});

  @override
  State<TrainingCenter> createState() => _TrainingCenterState();
}

class _TrainingCenterState extends State<TrainingCenter> {
  @override
  Widget build(BuildContext context) {
    //! this is for filling the Training center data

    if (user.token == "") {
      //! This is where the screen of user is not loged in
      return const TCNotLogged();
    }
    if (user.trainingCenterId == null) {
      //! THis is where the screen of user is loged in but doesnot have a training center
      return const TCLoggedIn();
    }
    return Scaffold(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Training Center",
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff1776e0)),
                      ),
                    ),
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(children: [
                          CachedNetworkImage(
                            imageUrl: TC.logo,
                            height: 120,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              "${TC.name} Center",
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Main Branch",
                        style:
                            TextStyle(fontSize: 28, color: Color(0xff1776e0)),
                      ),
                    ),
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Center(
                      child: Card(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                          width: (MediaQuery.of(context).size.width / 1.1),
                          height: 180,
                          child: InkWell(
                            highlightColor: null,
                            borderRadius: BorderRadius.circular(20),
                            splashFactory:
                                InkSparkle.constantTurbulenceSeedSplashFactory,
                            onTap: () {},
                            //////////////////////////////////////////////////
                            ///
                            ///
                            ///Here where you write your code on tap

                            ///////////////////////////////////////////////////
                            ///
                            ///
                            ///

                            splashColor: const Color(0xdd1776e0),
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                          value: progress.progress)),
                              imageUrl: TC.image,
                              imageBuilder: (context, imageProvider) => Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    child: Text(
                                      (languageType == 0)
                                          ? TC.location.city_ar
                                          : TC.location.city_en,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                    alignment: (languageType == 0)
                                        ? Alignment.bottomRight
                                        : Alignment.bottomLeft,
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
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: (TC.branch == null)
                          ? Container()
                          : Text(
                              "Branches",
                              style: TextStyle(
                                  fontSize: 28, color: Color(0xff1776e0)),
                            ),
                    ),
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: (TC.branch == null)
                          ? Container()
                          : Column(children: [
                              for (int i = 0; i < TC.branch!.length; i++)
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
                                        onTap: () {},
                                        //////////////////////////////////////////////////
                                        ///
                                        ///
                                        ///Here where you write your code on tap

                                        ///////////////////////////////////////////////////
                                        ///
                                        ///
                                        ///

                                        splashColor: const Color(0xdd1776e0),
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          value: progress
                                                              .progress)),
                                          imageUrl: TC.branch![i].image,
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
                                                child: Text(
                                                  (languageType == 0)
                                                      ? TC.branch![i].location
                                                          .city_ar
                                                      : TC.branch![i].location
                                                          .city_en,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                                alignment: (languageType == 0)
                                                    ? Alignment.bottomRight
                                                    : Alignment.bottomLeft,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ]),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
