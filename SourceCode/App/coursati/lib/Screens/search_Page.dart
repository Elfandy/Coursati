import 'dart:convert';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Search/SearchResults.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Classes/BoxCourseLabelData.dart';
import '../Classes/BoxTCLabelData.dart';
import '../Classes/TagData.dart';
import '../Classes/Trainer.dart';
import '../Services/ScreenController.dart';
import '../Widgets/CustomeWidgets/TagChip.dart';
import 'SubScreen/AllMapScreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Tag> _selectedTags = [], _selectedTypes = [];
  static final List<Tag> _tagTypeList = [
    Tag(id: 1, name_ar: "دورة", name_en: "Course"),
    Tag(id: 2, name_ar: "مركز تدريب", name_en: "Training Center")
  ];
  // bool _selectedRepeat = false;
  refresh() {
    setState(() {});
  }

  final TextEditingController _search = TextEditingController();

  List<BoxTCLabelData> _TrainingCenterList = [];
  List<BoxCourseLabelData> _CourseList = [];
  List<Trainer> _TrainersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedTags = [];
    _selectedTypes = _tagTypeList;
  }

  bool searching = false;
  @override
  Widget build(BuildContext context) {
    print(_selectedTypes.toString());
    print(_tagTypeList.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 1.3),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      cursorWidth: 1,
                      style: TextStyle(
                          color: (isDark) ? Colors.white : Colors.black),
                      onSubmitted: (value) {
                        if (value != '') {
                          setState(() {
                            searching = true;
                          });
                        } else {
                          setState(() {
                            searching = false;
                          });
                        }
                      },
                      onTapOutside: (event) {
                        if (_search.text != '') {
                        } else {
                          setState(() {
                            searching = false;
                          });
                        }
                      },
                      onTap: () {
                        if (_search.selection ==
                            TextSelection.fromPosition(TextPosition(
                                offset: _search.text.length - 1))) {
                          _search.selection = TextSelection.fromPosition(
                              TextPosition(offset: _search.text.length));
                        }
                      },
                      controller: _search,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            if (_search.text != '') {
                              setState(() {
                                searching = true;
                              });
                            } else {
                              setState(() {
                                searching = false;
                              });
                            }
                          },
                        ),
                        hintText: (languageType == 0) ? "البحث" : "Search",
                        contentPadding: const EdgeInsets.all(2.5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                Container(
                  width: 60,
                  height: 40,
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      //!! This is the bottom sheet
                      setState(() {
                        FocusManager.instance.primaryFocus?.unfocus();
                        showFlexibleBottomSheet(
                          maxHeight: 1,
                          minHeight: 0.5,
                          initHeight: 0.6,
                          context: context,
                          isDismissible: true,
                          bottomSheetColor: Colors.transparent,
                          anchors: [0, 0.6, 1],
                          builder:
                              (context, scrollController, bottomSheetOffset) {
                            return Material(
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: (isDark)
                                        ? const Color(0xff424242)
                                        : Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ListView(
                                    controller: scrollController,
                                    dragStartBehavior: DragStartBehavior.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: const Color(0xffdddddd),
                                          ),
                                          height: 8,
                                          width: 100,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: double.infinity,
                                        height: 20,
                                      ),
                                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 0),
                                        child: Text(
                                          (languageType == 0)
                                              ? "النوع"
                                              : "Type",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff1776e0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 10),
                                        child: Wrap(
                                          spacing: 10,
                                          children: [
                                            TagChip(
                                              passiveBackgroundColor: (isDark)
                                                  ? const Color.fromRGBO(
                                                      250, 250, 250, 0.5)
                                                  : const Color.fromRGBO(
                                                      200, 200, 200, 0.5),
                                              minuimumSelection: 1,
                                              selected: _selectedTypes,
                                              tag: _tagTypeList[0],
                                            ),
                                            TagChip(
                                              passiveBackgroundColor: (isDark)
                                                  ? const Color.fromRGBO(
                                                      250, 250, 250, 0.5)
                                                  : const Color.fromRGBO(
                                                      200, 200, 200, 0.5),
                                              minuimumSelection: 1,
                                              selected: _selectedTypes,
                                              tag: _tagTypeList[1],
                                            ),
                                          ],
                                        ),
                                      ),
                                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Divider(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 0),
                                        child: Text(
                                          (languageType == 0) ? "وسوم" : "Tags",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff1776e0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 10),
                                        child: Wrap(
                                          spacing: 10,
                                          children: [
                                            for (Tag i in tags)
                                              TagChip(
                                                passiveBackgroundColor: (isDark)
                                                    ? const Color.fromRGBO(
                                                        250, 250, 250, 0.5)
                                                    : const Color.fromRGBO(
                                                        200, 200, 200, 0.5),
                                                selected: _selectedTags,
                                                tag: i,
                                              ),
                                          ],
                                        ),
                                      ),
                                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                                      Center(
                                        child: ElevatedButton(
                                          child: Text(
                                            (languageType == 0)
                                                ? "إعادة ضبط"
                                                : "Reset",
                                            style: TextStyle(
                                                color: (isDark)
                                                    ? Color(0xff424242)
                                                    : Colors.white),
                                          ),
                                          onPressed: () {
                                            setState(
                                              () {
                                                _selectedTags = [];
                                                _selectedTypes = _tagTypeList;
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    },
                    icon: const Image(
                      image: AssetImage("Assets/Icons/options.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          (searching)
              ? FutureBuilder(
                  future: fetchSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List SearchJson = snapshot.data!;
                      for (var SearchJson in SearchJson) {
                        if (SearchJson["type"] == "course") {
                          _CourseList.add(
                              BoxCourseLabelData.fromJson(SearchJson));
                        } else if (SearchJson["type"] == "trainingcenter") {
                          _TrainingCenterList.add(
                              BoxTCLabelData.fromJson(SearchJson));
                        }
                      }

                      return SearchResult();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage(
                            "Assets/Icons/handy-line-pin-on-the-map-waving.png",
                          ),
                          height: (MediaQuery.of(context).size.height / 3),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          (languageType == 0)
                              ? "أبدء البحث"
                              : "Start Searching",
                          style: const TextStyle(
                              fontSize: 32, color: Color(0xff999999)),
                        ),
                        Text(
                          (languageType == 0) ? "أو" : "OR",
                          style: const TextStyle(
                              fontSize: 26, color: Color(0xff999999)),
                        ),
                        TextButton(
                          child: Text(
                            (languageType == 0) ? "إذهب للخريطة" : "Go To Map",
                            style: const TextStyle(
                                fontSize: 32, color: Color(0xff1776e0)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(ScreenController()
                                .createRoute(AllMapScreen(), 1));
                          },
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<List> fetchSearch() async {
    var url = "search/multy";
    Map search = {};
    String jsonTags = json.encode(_selectedTags);
    String jsonType = json.encode(_selectedTypes);
    List SearchJson = [];
    Map<String, dynamic> listJson = {
      "Search": _search.text,
      "Tags": _selectedTags,
      "Types": _selectedTypes
    };

    try {
      _TrainingCenterList.clear();
      _CourseList.clear();
      var response = await dioTestApi.post(
        url,
        data: json.encode(listJson),
      );

      if (response.statusCode == 200) {
        SearchJson = response.data["search"];
      }
    } catch (e) {
      print(e);
    }
    return SearchJson;
  }
}
