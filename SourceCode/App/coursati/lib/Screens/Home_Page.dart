import 'package:coursati/Widgets/Box.dart';
import 'package:flutter/material.dart';

import '../Widgets/RoundedButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Align(
              alignment: Alignment.topRight,
              widthFactor: 5,
              child: Image.asset(
                "Assets/Logo/MainLogoTilted.png",
                scale: 4,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    "Assets/Logo/Coursati.png",
                    scale: 3,
                  )
                ],
              ),
            ),
          ]),
          Column(
            children: [
              Text("Popular Courses"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Box(),
                    Box(),
                    Box(),
                    Box(),
                    RoundedButton(
                      icon: Icon(Icons.abc),
                      onPressed: () => {},
                      color: Color(0xff999999),
                      size: 50,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
