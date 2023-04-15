import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Signin/SignUpTextFeild.dart';

enum Gender { male, female }

class FloatingSigninBox extends StatefulWidget {
  const FloatingSigninBox({super.key});

  @override
  State<FloatingSigninBox> createState() => _FloatingSigninBoxState();
}

class _FloatingSigninBoxState extends State<FloatingSigninBox> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController date = TextEditingController();
  bool showPass = false;
  Gender? _gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SignupTextFeild(
            icon: Icons.person_rounded,
            text: name,
            text_ar: "الأسم",
            text_en: "Name",
            onTap: () {
              //! This is the fix for selecting the last charcter in the

              if (name.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: name.text.length - 1))) {
                name.selection = TextSelection.fromPosition(
                    TextPosition(offset: name.text.length));
              }
            },
            maxLingth: 20,
          ),
          SignupTextFeild(
            icon: Icons.email_outlined,
            text: email,
            text_ar: "البريد الإلكتروني",
            text_en: "Email",
            onTap: () {
              //! This is the fix for selecting the last charcter in the

              if (name.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: name.text.length - 1))) {
                name.selection = TextSelection.fromPosition(
                    TextPosition(offset: name.text.length));
              }
            },
            maxLingth: 32,
          ),
          SignupTextFeild(
            icon: Icons.lock_outline_rounded,
            text: password,
            text_ar: "الرمز السري",
            text_en: "Password",
            eyeOfSeeing: true,
            onTap: () {
              //! This is the fix for selecting the last charcter in the

              if (name.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: name.text.length - 1))) {
                name.selection = TextSelection.fromPosition(
                    TextPosition(offset: name.text.length));
              }
            },
            maxLingth: 26,
            password: !showPass,
          ),
          SignupTextFeild(
            icon: Icons.calendar_today_outlined,
            text: date,
            text_ar: "تاريخ الميلاد",
            text_en: "BirthDate",
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: DateTime.now(),
                  lastDate: DateTime.now());

              if (pickedDate != null) {
                String foramteDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  date.text = foramteDate;
                });
              } else {}
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.fromLTRB(
          //       50, 0, 50, 10),
          //   child: Row(
          //     mainAxisAlignment:
          //         MainAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: RadioListTile(
          //           contentPadding: EdgeInsets.all(0),
          //           value: Gender.male,
          //           groupValue: _gender,
          //           shape: RoundedRectangleBorder(
          //               borderRadius:
          //                   BorderRadius.circular(20)),
          //           onChanged: (value) {
          //             setState(
          //               () {
          //                 _gender = value;
          //               },
          //             );
          //           },
          //           title: Text(
          //             "Male",
          //             style: TextStyle(
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Expanded(
          //         child: RadioListTile(
          //           contentPadding: EdgeInsets.all(0),
          //           value: Gender.female,
          //           groupValue: _gender,
          //           tileColor: Colors.amber,
          //           onChanged: (value) {
          //             setState(() {
          //               _gender = value;
          //             });
          //           },
          //           title: Text(
          //             "female",
          //             style: TextStyle(
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
