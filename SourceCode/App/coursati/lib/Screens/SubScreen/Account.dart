import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';
import '../../main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "إدارة الحساب" : "Account",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(),
    );
  }
}
