import 'package:flutter/material.dart';

class RoundedSigninButton extends StatefulWidget {
  const RoundedSigninButton({super.key});

  @override
  State<RoundedSigninButton> createState() => _RoundedSigninButtonState();
}

class _RoundedSigninButtonState extends State<RoundedSigninButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0x4007AD18),
            Color(0xff1776E0),
          ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
