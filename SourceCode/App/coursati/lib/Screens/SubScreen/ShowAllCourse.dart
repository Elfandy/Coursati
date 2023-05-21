import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:flutter/material.dart';

import '../../Classes/BoxCourseLabelData.dart';

class ShowCourses extends StatefulWidget {
  const ShowCourses({super.key});

  @override
  State<ShowCourses> createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCourses> {
  TextEditingController _search = TextEditingController();
  bool _visibleSearch = false;

  List<BoxCourseLabelData> _searching = [];
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
      body: SingleChildScrollView(
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
                    for (BoxCourseLabelData i in courseBLDsmall) {
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
                for (BoxCourseLabelData i in courseBLDsmall)
                  CourseBox(
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
                  CourseBox(
                    bld: i,
                  ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
