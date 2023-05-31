import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Widgets/Home/CourseBox.dart';
import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/material.dart';

class AllTCShowWithSearch extends StatefulWidget {
  AllTCShowWithSearch({super.key, required this.trainingCenter});
  List<BoxTCLabelData> trainingCenter;

  @override
  State<AllTCShowWithSearch> createState() => _AllTCShowWithSearchState();
}

class _AllTCShowWithSearchState extends State<AllTCShowWithSearch> {
  TextEditingController _search = TextEditingController();
  bool _visibleSearch = false;

  List<BoxTCLabelData> _searching = [];
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
                  for (BoxTCLabelData i in widget.trainingCenter) {
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
              for (BoxTCLabelData i in widget.trainingCenter)
                TCBox(
                  bld: i,
                ),
            ],
          ),
        ),
        Visibility(
          visible: _visibleSearch,
          child: Wrap(
            children: [
              for (BoxTCLabelData i in _searching)
                TCBox(
                  bld: i,
                ),
            ],
          ),
        )
      ]),
    );
  }
}
