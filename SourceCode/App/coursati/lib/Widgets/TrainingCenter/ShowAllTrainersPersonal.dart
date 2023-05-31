import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

class ShowAllTrainerPersonal extends StatefulWidget {
  const ShowAllTrainerPersonal({super.key});

  @override
  State<ShowAllTrainerPersonal> createState() => _ShowAllTrainerPersonalState();
}

class _ShowAllTrainerPersonalState extends State<ShowAllTrainerPersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((languageType == 0) ? "مدربين " : "Trainer"),
      ),
    );
  }
}
