import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';

import 'package:coursati/Widgets/Home/TCBox.dart';
import 'package:flutter/material.dart';

class ShowTC extends StatefulWidget {
  const ShowTC({super.key});

  @override
  State<ShowTC> createState() => _ShowTCState();
}

class _ShowTCState extends State<ShowTC> {
  TextEditingController _search = TextEditingController();
  bool _visibleSearch = false;

  List<BoxTCLabelData> _searching = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        elevation: 2,
        title: Text(
            (languageType == 0) ? "المراكز التدريبية" : "Training Center",
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
                    for (BoxTCLabelData i in trainingCenterBLDSmall) {
                      if (i.name
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
                for (BoxTCLabelData i in trainingCenterBLDSmall)
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
      ),
    );
  }
}
