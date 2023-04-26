import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Screens/SubScreen/AddTrainingCenter.dart';
import '../../Services/ScreenController.dart';

class TCLoggedIn extends StatefulWidget {
  const TCLoggedIn({super.key});

  @override
  State<TCLoggedIn> createState() => _TCLoggedInState();
}

class _TCLoggedInState extends State<TCLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (languageType == 0) ? "مرحبا في كورساتي" : "Welcome to Coursati",
              style: TextStyle(color: Color(0xff1776e0), fontSize: 32),
            ),
            Image.asset(
              "Assets/Images/handy-line-analytics-solves-the-problem.png",
              height: (MediaQuery.of(context).size.width / 1.3),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Text(
                (languageType == 0)
                    ? "يبدو أنك لم تسجل مركز تدريب مسبقاً"
                    : "IT seems that you don’t have any Training Centers Yet",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(230, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.of(context).push(
                    ScreenController().createRoute(
                      AddTrainingCenterPage(),
                      0,
                    ),
                  );
                },
                child: Text(
                  (languageType == 0)
                      ? "أضف مركز تدريب"
                      : "Add Training Center",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
