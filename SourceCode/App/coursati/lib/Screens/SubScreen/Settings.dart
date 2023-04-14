import 'package:flutter/material.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          splashColor: Color(0xff1776e0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff1776e0),
          ),
        ),
        shadowColor: Color(0xff1776e0),
        title: Text(
          (languageType == 0) ? "الإعدادات" : "Settings",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(),
      
    );
  }
}
