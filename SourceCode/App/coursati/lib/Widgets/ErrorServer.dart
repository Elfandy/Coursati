import 'package:flutter/material.dart';

class ServerError extends StatelessWidget {
  const ServerError({super.key, required this.error});
  final int error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "Assets/Images/Disconnected/GIFS/techny-404-error-in-laptop.png"),
                Text(
                  "Sorry for the inconviniance:\n${(error == 2) ? "We can't connect to the server please try again later" : "It seems that the server is Down Please try again later and thank you for your patiance"}",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}
