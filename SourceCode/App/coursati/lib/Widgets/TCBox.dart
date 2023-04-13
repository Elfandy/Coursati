import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/BoxTCLabelData.dart';
import 'package:coursati/Widgets/BoxCourseLabel.dart';
import 'BoxCourseLabel.dart';
import 'package:flutter/material.dart';

class TCBox extends StatefulWidget {
  TCBox({super.key, required this.image, required this.bld}) {}

  final String image;
  final BoxTCLabelData bld;

  @override
  State<TCBox> createState() => _TCBoxState();
}

class _TCBoxState extends State<TCBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 0, 20),
      height: 240,
      width: 170,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
            colors: [Colors.black, Color(0x00ffffff)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
