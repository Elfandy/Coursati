import 'dart:math';

import 'package:coursati/main.dart';
import 'package:flutter/material.dart';

Random r = Random();

class NetworkPopup extends StatefulWidget {
  const NetworkPopup({super.key});

  @override
  State<NetworkPopup> createState() => _NetworkPopupState();
}

class _NetworkPopupState extends State<NetworkPopup> {
  //? -----------------------------------------------------------

  int picker = r.nextInt(1);
  List<String> image = [
    "Assets/Images/Disconnected/GIFS/sammy-no-connection.gif",

  ];

  //? -------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 400,
      child: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(image[picker]),
            ),
            Text(
              (languageType == 0)
                  ? "يبدو أنه لايوجد اتصال بالانترنت"
                  : "It semms like there is no Internet Connection",
              style: TextStyle(
                  color: Color(0xff1776e0),
                  fontSize: 20,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                  fontFamily: (languageType == 0) ? "" : "Suravaram",
                  shadows: [Shadow(color: Colors.black, blurRadius: 0.5)]),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
