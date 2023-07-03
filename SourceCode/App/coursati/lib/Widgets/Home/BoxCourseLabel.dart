import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';
import '../../main.dart';

class BoxCourseLabel extends StatefulWidget {
  BoxCourseLabel({super.key, required this.bld});
  BoxCourseLabelData bld;

  @override
  State<BoxCourseLabel> createState() => _BoxCourseLabelState();
}

class _BoxCourseLabelState extends State<BoxCourseLabel> {
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
              widget.bld.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  (languageType == 0)
                      ? "${widget.bld.location_in}"
                      : "${widget.bld.location_in}",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: (languageType == 0) ? 10 : 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
