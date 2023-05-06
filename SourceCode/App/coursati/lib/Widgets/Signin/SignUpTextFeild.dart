import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Classes/GlobalVariables.dart';

class SignupTextFeild extends StatefulWidget {
  SignupTextFeild({
    super.key,
    required this.icon,
    required this.textController,
    required this.text_ar,
    required this.text_en,
    this.maxLingth,
    this.readOnly = false,
    this.password = false,
    this.eyeOfSeeing = false,
    required this.onTap,
    required this.onChange,
  });
  String text_ar, text_en;
  IconData icon;
  TextEditingController textController;
  int? maxLingth;
  bool readOnly, password, eyeOfSeeing;
  void Function() onTap;
  void Function(String?) onChange;

  @override
  State<SignupTextFeild> createState() => _SignupTextFeildState();
}

class _SignupTextFeildState extends State<SignupTextFeild> {
  Icon visibile = const Icon(
    Icons.visibility_off,
    size: 20,
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
          onChanged: widget.onChange,
          // onTapOutside: widget.onTapOutSide,
          maxLengthEnforcement:
              MaxLengthEnforcement.truncateAfterCompositionEnds,
          readOnly: widget.readOnly,
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          maxLength: widget.maxLingth,
          onTap: widget.onTap,
          style: TextStyle(
              color: isDark ? Colors.white : Colors.black, fontSize: 16),
          controller: widget.textController,
          decoration: InputDecoration(
            counterText: "",
            suffixIcon: (widget.eyeOfSeeing)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.password = !widget.password;
                        if (widget.password) {
                          visibile = const Icon(
                            Icons.visibility_off,
                            size: 20,
                          );
                        } else {
                          visibile = const Icon(
                            Icons.visibility,
                            size: 20,
                          );
                        }
                      });
                    },
                    icon: visibile)
                : const Icon(null),
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
                style: TextStyle(
                    fontSize: 16,
                    color: (isDark) ? Colors.white : Colors.black),
              ),
            ]),
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
