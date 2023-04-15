import 'package:flutter/material.dart';

class LanguageToggle extends StatefulWidget {
  LanguageToggle({super.key, required this.selectorTemp});
  List<bool> selectorTemp;

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: widget.selectorTemp,
      onPressed: ((index) {
        setState(() {
          if (index == 0) {
            if (widget.selectorTemp[index] == false) {
              widget.selectorTemp[index] = true;
              widget.selectorTemp[index + 1] = false;
            }
          } else if (index == 1) {
            if (widget.selectorTemp[index] == false) {
              widget.selectorTemp[index] = true;
              widget.selectorTemp[index - 1] = false;
            }
          }
        });
      }),
      children: const [Text("AR"), Text("EN")],
    );
  }
}
