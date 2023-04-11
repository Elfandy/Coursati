import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:flutter/material.dart';

import '../Classes/Course.dart';
import '../Classes/Tag.dart';
import '../Classes/Trainer.dart';

class Box extends StatefulWidget {
  Box({super.key}) {}

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 20, 0, 20),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1681125282872-ecd5e684ecc4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80"),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
            colors: [Colors.black, Color(0x00ffffff)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: 150,
            ),
            Text("hello wrold"),
          ],
        ),
      ),
    );
  }
}
