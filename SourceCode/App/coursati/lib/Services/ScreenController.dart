import 'package:flutter/material.dart';

import '../main.dart';

class ScreenController {
  void restartApp(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ));
  }
  
}
