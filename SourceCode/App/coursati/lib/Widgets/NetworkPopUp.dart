import 'package:flutter/material.dart';

class NetworkPopup extends StatefulWidget {
  const NetworkPopup({super.key});

  @override
  State<NetworkPopup> createState() => _NetworkPopupState();
}

class _NetworkPopupState extends State<NetworkPopup> {
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
          children: const [
            Image(
              image: AssetImage("Assets/Images/GIFS/sammy-no-connection.gif"),
            ),
            Text(
              "It semms like there is no Internet Connection",
              style: TextStyle(
                  color: Color(0xff1776e0),
                  fontSize: 20,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Suravaram",
                  shadows: [Shadow(color: Colors.black, blurRadius: 0.5)]),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
