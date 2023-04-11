import 'package:flutter/material.dart';

class TrainingCenter extends StatefulWidget {
  const TrainingCenter({super.key});

  @override
  State<TrainingCenter> createState() => _TrainingCenterState();
}

class _TrainingCenterState extends State<TrainingCenter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("hello This is Training Center")],
    );
  }
}
