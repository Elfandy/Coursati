import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';

class BoxTCLabel extends StatefulWidget {
  BoxTCLabel({super.key, required this.bld});
  BoxTCLabelData bld;

  @override
  State<BoxTCLabel> createState() => _BoxTCLabelState();
}

class _BoxTCLabelState extends State<BoxTCLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            softWrap: true,
            widget.bld.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Image.asset(
                  "Assets/Icons/map-pin-location.png",
                  scale: 6,
                  color: Color(0xff1776e0),
                ),
                SizedBox(
                  width: 6,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    );
  }
}
