import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:flutter/material.dart';

class BoxTCLabel extends StatefulWidget {
  BoxTCLabel({super.key, required this.bld});
  BoxTCLabelData bld;

  @override
  State<BoxTCLabel> createState() => _BoxTCLabelState();
}

class _BoxTCLabelState extends State<BoxTCLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            child: Text(
              softWrap: true,
              widget.bld.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
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
              Container(
                child: Text(
                  "في مركز ",
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
