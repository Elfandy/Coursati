import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Classes/GlobalVariables.dart';

class SignupTextFeild extends StatefulWidget {
  SignupTextFeild({
    super.key,
    required this.icon,
    required this.text,
    required this.text_ar,
    required this.text_en,
    this.maxLingth,
    this.readOnly = false,
    this.password = false,
    this.eyeOfSeeing = false,
    required this.onTap,
  });
  String text_ar, text_en;
  IconData icon;
  TextEditingController text;
  int? maxLingth;
  bool readOnly, password, eyeOfSeeing;
  void Function() onTap;

  @override
  State<SignupTextFeild> createState() => _SignupTextFeildState();
}

class _SignupTextFeildState extends State<SignupTextFeild> {
  Icon visibile = Icon(
    Icons.visibility_off,
    size: 20,
    color: Color(0xffdddddd),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 5),
      child: SizedBox(
        height: 50,
        child: TextField(
          selectionControls: EmptyTextSelectionControls(),
          obscureText: widget.password,
          enableSuggestions: !widget.password,
          autocorrect: !widget.password,
          maxLengthEnforcement:
              MaxLengthEnforcement.truncateAfterCompositionEnds,
          readOnly: widget.readOnly,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          maxLength: widget.maxLingth,
          onTap: widget.onTap,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          controller: widget.text,
          decoration: InputDecoration(
            counterText: "",
            suffixIcon: (widget.eyeOfSeeing)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.password = !widget.password;
                        if (widget.password) {
                          visibile = Icon(
                            Icons.visibility_off,
                            size: 20,
                            color: Color(0xffdddddd),
                          );
                        } else {
                          visibile = Icon(
                            Icons.visibility,
                            size: 20,
                            color: Color(0xff999999),
                          );
                        }
                      });
                    },
                    icon: visibile)
                : Icon(null),
            label: Row(children: [
              Icon(
                widget.icon,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                (languageType == 0) ? widget.text_ar : widget.text_en,
                style: const TextStyle(fontSize: 16),
              ),
            ]),
            border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
    );
  }
}
