import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:flutter/material.dart';



class BoxCourseLabelPersonal extends StatefulWidget {
  BoxCourseLabelPersonal({super.key, required this.bld});
  BoxCourseLabelData bld;

  @override
  State<BoxCourseLabelPersonal> createState() => _BoxCourseLabelPersonalState();
}

class _BoxCourseLabelPersonalState extends State<BoxCourseLabelPersonal> {
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
              const SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
