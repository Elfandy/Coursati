import 'package:flutter/material.dart';

import '../main.dart';

class ScreenController {
  void restartApp(context) {
    //! old restart has a bug that make you go back to the parent of previous screen
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const MainApp(),
    //     ));
    //* new restart fixed the issue with the old screen
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ),
        (Route<dynamic> route) => false);
  }
}
