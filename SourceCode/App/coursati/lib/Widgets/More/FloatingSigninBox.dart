import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Classes/GlobalVariables.dart';
import '../Signin/SignUpTextFeild.dart';
import 'RoundedSigninButton.dart';

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
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: (login)
              ? (MediaQuery.of(context).size.height / 4)
              : (MediaQuery.of(context).size.height / 6),
          child: const SizedBox(
            width: double.infinity,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: (login)
              ? (MediaQuery.of(context).size.height / 2.1)
              : (MediaQuery.of(context).size.height / 1.35),
          child: Container(
            width: (MediaQuery.of(context).size.width / 1.1),
            child: Stack(children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: (login)
                    ? ((MediaQuery.of(context).size.height / 2.1) - 60)
                    : ((MediaQuery.of(context).size.height / 1.35) - 60),
                child: Container(
                    width: (MediaQuery.of(context).size.width / 1.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (!login) {
                                      login = !login;
                                    }
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: (languageType == 0)
                                      ? const EdgeInsets.fromLTRB(0, 15, 20, 2)
                                      : const EdgeInsets.fromLTRB(20, 20, 2, 0),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      (languageType == 0)
                                          ? "تسجيل الدخول"
                                          : "LOGIN",
                                      style: TextStyle(
                                        fontSize: (languageType == 0) ? 20 : 32,
                                        color: (!login)
                                            ? const Color(0xffdddddd)
                                            : const Color(0xff000088),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: (login)
                                          ? const Divider(
                                              color: Color(0xff1776e0),
                                              height: 1,
                                              thickness: 2)
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (login) {
                                      login = !login;
                                    }
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: (languageType == 0)
                                      ? const EdgeInsets.fromLTRB(20, 15, 0, 2)
                                      : const EdgeInsets.fromLTRB(2, 20, 20, 0),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      (languageType == 0)
                                          ? "إنشاء حساب"
                                          : "SIGNUP",
                                      style: TextStyle(
                                        fontSize: (languageType == 0) ? 20 : 32,
                                        color: (login)
                                            ? const Color(0xffdddddd)
                                            : const Color(0xff000088),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: (!login)
                                          ? const Divider(
                                              color: Color(0xff1776e0),
                                              height: 1,
                                              thickness: 2)
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        // const Divider(),
                        //*This is where you put you Textboxes and stuff
                        // FloatingSigninBox(),
                        Container(
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
                                      TextSelection.fromPosition(TextPosition(
                                          offset: name.text.length - 1))) {
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
                                      TextSelection.fromPosition(TextPosition(
                                          offset: name.text.length - 1))) {
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
                                      TextSelection.fromPosition(TextPosition(
                                          offset: name.text.length - 1))) {
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
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
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
                        ),
                      ],
                    )),
              ),
              //*this is the rounded button
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundedSigninButton(),
              )
            ]),
          ),
        )
      ],
    );
  }
}
