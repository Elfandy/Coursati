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

class _RoundedButtonState extends State<RoundedButton>
    with TickerProviderStateMixin {
  late AnimationController _boxAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _boxAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _boxAnimationController,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ElevatedButton(
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            shape: const CircleBorder(),
            fixedSize: Size(widget.size, widget.size),
            shadowColor: const Color(0xff1776e0),
          ),
          child: widget.icon,
        ),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      _boxAnimationController
          .forward()
          .then(((value) => {_boxAnimationController.reverse()}));
    });
    /////////////////////////////////////////////////////////////
    ///
    ///
    //Write your code here
    widget.onPressed;

    ///
    ///
    //////////////////////////////////////////////////////////////
  }
}
