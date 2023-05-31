import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

class AddTrainer extends StatefulWidget {
  const AddTrainer({super.key});

  @override
  State<AddTrainer> createState() => _AddTrainerState();
}

class _AddTrainerState extends State<AddTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((languageType == 0) ? "إضافة مدرب" : "Add Trainer"),
      ),
    );
  }
}
