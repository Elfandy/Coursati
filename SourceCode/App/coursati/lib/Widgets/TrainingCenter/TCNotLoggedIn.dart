import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Screens/SubScreen/loginPage.dart';
import 'package:flutter/material.dart';

import '../../Services/ScreenController.dart';

class TCNotLogged extends StatefulWidget {
  const TCNotLogged({super.key});

  @override
  State<TCNotLogged> createState() => _TCNotLoggedState();
}

class _TCNotLoggedState extends State<TCNotLogged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Coursati",
              style: TextStyle(color: Color(0xff1776e0), fontSize: 32),
            ),
            Image.asset(
              "Assets/Images/handy-line-cyber-security.png",
              height: (MediaQuery.of(context).size.width / 1.5),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Text(
                "Please Login/Signin to Create Or manage Training Centers",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.of(context).push(
                    ScreenController().createRoute(
                      loginPage(contextIn: context,),
                      0,
                    ),
                  );
                  
                },
                child: const Text(
                  "Login/Sigin",
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
