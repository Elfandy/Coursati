import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/AllCoursesShowWithSearch.dart';
import 'package:coursati/Widgets/Home/AllTCShowwithSearch.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/BoxCourseLabelData.dart';

class SearchResult extends StatefulWidget {
  SearchResult(
      {super.key, required this.courseList, required this.trainingCenterList});
  List<BoxCourseLabelData> courseList;
  List<BoxTCLabelData> trainingCenterList;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  var myStreamBuilder;
  @override
  void initState() {
    super.initState();
    myStreamBuilder = StreamBuilder<dynamic>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    indicatorColor: Color(0xff1776e0),
                    unselectedLabelColor: Colors.grey,
                    labelColor: Color(0xff1776e0),
                    tabs: [
                      Tab(
                        child: Icon(Icons.menu_book_sharp),
                      ),
                      Tab(
                        child: Icon(Icons.home_work_outlined),
                      )
                    ],
                  )),
              body: TabBarView(
                children: [
                  (widget.courseList.isNotEmpty)
                      ? ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (BoxCourseLabelData course
                                        in widget.courseList)
                                      CourseBox(bld: course)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(
                                  "Assets/Images/techny-searching-the-web-on-tablet.gif"),
                              Text(languageType == 0
                                  ? "يبدو انه لا يوجد دورات بالبحث المطلوب"
                                  : "There seems there are no courses"),
                            ],
                          ),
                        ),
                  (widget.trainingCenterList.isNotEmpty)
                      ? ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (BoxTCLabelData trainingCenter
                                        in widget.trainingCenterList)
                                      TCBox(bld: trainingCenter)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(
                                  "Assets/Images/techny-searching-the-web-on-tablet.gif"),
                              Text(languageType == 0
                                  ? "يبدو انه لا يوجد مراكز تدريبية بالبحث المطلوب"
                                  : "There seems there are no Training center"),
                            ],
                          ),
                        ),
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return myStreamBuilder;
  }
}
