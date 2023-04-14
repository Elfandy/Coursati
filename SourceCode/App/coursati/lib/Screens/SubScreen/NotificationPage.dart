import 'package:flutter/material.dart';

import '../../main.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          (languageType == 0) ? "الإشعارات" : "Notification",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(),
    );
  }
}
