import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Classes/GlobalVariables.dart';
import 'SignUpTextFeild.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _birthDate = TextEditingController();
  TextEditingController _loginEmail = TextEditingController();
  TextEditingController _loginPass = TextEditingController();
  int _isSelected = 0, _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: Container(
          color: Colors.white,
          child: Center(
              child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          (languageType == 0) ? "تسحيل الدخول" : "Login",
                          style: TextStyle(
                              color: (_isSelected != 0)
                                  ? Color(0xff1776e0)
                                  : Color(0xff999999),
                              fontSize: (languageType == 0) ? 18 : 36),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isSelected == 0) {
                              _isSelected = 1;
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          (languageType == 0) ? "إنشاء حساب" : "Signin",
                          style: TextStyle(
                              color: (_isSelected == 0)
                                  ? Color(0xff1776e0)
                                  : Color(0xff999999),
                              fontSize: (languageType == 0) ? 18 : 36),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_isSelected == 1) {
                              _isSelected = 0;
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    child: (_isSelected == 0)
                        ? Column(
                            children: [
                              SignupTextFeild(
                                icon: Icons.person,
                                onTap: () {},
                                text_ar: "الاسم",
                                text_en: "Name",
                                textController: _name,
                              ),
                              SignupTextFeild(
                                icon: Icons.mail,
                                onTap: () {},
                                text_ar: "البريد الإلكتروني",
                                text_en: "Email",
                                textController: _email,
                              ),
                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {},
                                text_ar: "الرمز السري",
                                text_en: "Password",
                                textController: _password,
                              ),
                              SignupTextFeild(
                                icon: Icons.calendar_today,
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
                                      _birthDate.text = foramteDate;
                                    });
                                  } else {}
                                },
                                text_ar: "المبلاد",
                                text_en: "Birth Date",
                                textController: _birthDate,
                                readOnly: true,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_gender == 1) {
                                          _gender = 0;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.male_rounded,
                                      size: 40,
                                      color: (_gender == 0)
                                          ? Color(0xff1776e0)
                                          : Color(0xff999999),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: CircleBorder()),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_gender == 0) {
                                          _gender = 1;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.female_rounded,
                                      size: 40,
                                      color: (_gender != 0)
                                          ? Color(0xff1776e0)
                                          : Color(0xff999999),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: CircleBorder()),
                                  ),
                                ],
                              )
                            ],
                          )
                        : Column(
                            children: [
                              SignupTextFeild(
                                icon: Icons.mail,
                                onTap: () {},
                                text_ar: "البريد الإلكتروني",
                                text_en: "Email",
                                textController: _email,
                              ),
                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {},
                                text_ar: "الرمز السري",
                                text_en: "Password",
                                textController: _password,
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Image.asset(
            //     "Assets/Icons/Logo.png",
            //     scale: 6,
            //     height: (MediaQuery.of(context).size.height / 4),
            //   ),
            // ),
          ]))),
    );
  }
}
