import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';

import '../../Classes/TagData.dart';

class TagChip extends StatefulWidget {
  TagChip({
    super.key,
    required this.tag,
    required this.selected,
    this.activeBackgroundColor = const Color(0xff1776e0),
    this.passiveBackgroundColor = const Color.fromRGBO(250, 250, 250, 0.5),
    this.activeTextStyle = const TextStyle(color: Colors.white),
    this.passiveTextStyle = const TextStyle(color: Colors.black),
    this.padding = const EdgeInsets.all(9),
    this.elevation = 1,
    this.minuimumSelection = 0,
    this.selectable = true,
  });
  int minuimumSelection;
  Tag tag;
  List<Tag> selected;
  Color activeBackgroundColor, passiveBackgroundColor;
  TextStyle activeTextStyle, passiveTextStyle;
  EdgeInsets padding;
  double elevation;
  bool selectable;

  @override
  State<TagChip> createState() => _TagChipState();
}

class _TagChipState extends State<TagChip> {
  @override
  void initState() {
    // TODO: implement initState
    _background = (widget.selected.contains(widget.tag))
        ? widget.activeBackgroundColor
        : widget.passiveBackgroundColor;
    _check = (widget.selected.contains(widget.tag)) ? true : false;
    _style = (widget.selected.contains(widget.tag))
        ? widget.activeTextStyle
        : widget.passiveTextStyle;

    super.initState();
  }

  late TextStyle _style;
  late Color _background;
  late bool _check;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          if (widget.selectable) {
            if (!_check) {
              if (!widget.selected.contains(widget.tag)) {
                widget.selected.add(widget.tag);
              }

              _background = widget.activeBackgroundColor;
              _style = widget.activeTextStyle;
              _check = !_check;
            } else {
              if (widget.minuimumSelection < widget.selected.length) {
                if (widget.selected.contains(widget.tag)) {
                  widget.selected.remove(widget.tag);
                }
                _background = widget.passiveBackgroundColor;

                _style = widget.passiveTextStyle;
                _check = !_check;
              }
            }
          }
        });
      },
      child: Chip(
        elevation: widget.elevation,
        padding: widget.padding,
        backgroundColor: _background,
        label: Text(
          (languageType == 0) ? widget.tag.name_ar : widget.tag.name_en,
          style: _style,
        ),
      ),
    );
  }
}
