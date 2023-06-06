import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/TrainingCenter/PersonalCourseBox.dart';
import 'package:flutter/material.dart';

class AllCoursesShowWithSearch extends StatefulWidget {
  AllCoursesShowWithSearch({super.key, required this.courses});
  List<BoxCourseLabelData> courses;

  @override
  State<AllCoursesShowWithSearch> createState() =>
      _AllCoursesShowWithSearchState();
}

class _AllCoursesShowWithSearchState extends State<AllCoursesShowWithSearch> {
  TextEditingController _search = TextEditingController();
  bool _visibleSearch = false;

  List<BoxCourseLabelData> _searching = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            cursorWidth: 1,
            style: TextStyle(color: (isDark) ? Colors.white : Colors.black),
            onSubmitted: (value) {},
            controller: _search,
            cursorHeight: 20,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: (languageType == 0) ? "البحث" : "Search",
              contentPadding: const EdgeInsets.all(2.5),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onChanged: (value) {
              setState(() {
                if (value != '') {
                  _visibleSearch = true;
                  _searching.clear();
                  for (BoxCourseLabelData i in widget.courses) {
                    if (i.name!
                        .toLowerCase()
                        .contains(_search.text.toLowerCase())) {
                      _searching.add(i);
                    }
                  }
                } else {
                  _visibleSearch = false;
                }
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: !_visibleSearch,
          child: Wrap(
            children: [
              for (BoxCourseLabelData i in widget.courses)
                PersonalCourseBox(
                  bld: i,
                ),
            ],
          ),
        ),
        Visibility(
          visible: _visibleSearch,
          child: Wrap(
            children: [
              for (BoxCourseLabelData i in _searching)
                PersonalCourseBox(
                  bld: i,
                ),
            ],
          ),
        )
      ]),
    );
  }
}
