import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {super.key,
      required this.icon,
      this.color,
      required this.size,
      required this.onPressed});

  final Icon icon;
  final Color? color;
  final double size;
  final void Function()? onPressed;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          shape: const CircleBorder(),
          fixedSize: Size(widget.size, widget.size),
          shadowColor: const Color(0xff1776e0),
        ),
        child: widget.icon,
      ),
    );
  }
}
