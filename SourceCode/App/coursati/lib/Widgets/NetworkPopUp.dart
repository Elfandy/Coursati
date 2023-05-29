import 'dart:io';
import 'dart:math';

import 'package:coursati/main.dart';
import 'package:flutter/material.dart';

import '../Classes/GlobalVariables.dart';

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
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: (isDark) ? const Color(0xff424242) : Colors.white,
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
                      color: const Color(0xff1776e0),
                      fontSize: 20,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                      fontFamily: (languageType == 0) ? "" : "Suravaram",
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          (languageType == 0) ? "هل انت متأكد" : "Are you Sure?",
          style: TextStyle(color: (isDark) ? Colors.white : Colors.black),
        ),
        content: Text(
          (languageType == 0) ? "الخروج من التطبيق" : "Exit The App",
          style: TextStyle(color: (isDark) ? Colors.white : Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            //<-- SEE HERE
            child: Text((languageType == 0) ? "لا" : "No"),
          ),
          TextButton(
            onPressed: () => exit(0),
            // <-- SEE HERE
            child: Text((languageType == 0) ? "نعم" : "Yes"),
          ),
        ],
      ),
    ));
  }
}
