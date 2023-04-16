import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/UserData.dart';
import '../../Widgets/Signin/SignUpTextFeild.dart';

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
  int _accountFound = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: (isDark!) ? Colors.black38 : Colors.white,
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
          color: (isDark!) ? Colors.black38 : Colors.white,
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
                        onPressed: () {
                          setState(() {
                            if (_isSelected == 0) {
                              _isSelected = 1;
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        ),
                        child: Text(
                          (languageType == 0) ? "تسحيل الدخول" : "Login",
                          style: TextStyle(
                              color: (_isSelected != 0)
                                  ? const Color(0xff1776e0)
                                  : const Color(0xff999999),
                              fontSize: (languageType == 0) ? 18 : 36),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (_isSelected == 1) {
                              _isSelected = 0;
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        ),
                        child: Text(
                          (languageType == 0) ? "إنشاء حساب" : "Signin",
                          style: TextStyle(
                              color: (_isSelected == 0)
                                  ? const Color(0xff1776e0)
                                  : const Color(0xff999999),
                              fontSize: (languageType == 0) ? 18 : 36),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    switchInCurve: Curves.linear,
                    child: (_isSelected == 0)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                eyeOfSeeing: true,
                                password: true,
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
                              const SizedBox(
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
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: const CircleBorder()),
                                    child: Icon(
                                      Icons.male_rounded,
                                      size: 40,
                                      color: (_gender == 0)
                                          ? const Color(0xff1776e0)
                                          : const Color(0xff999999),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_gender == 0) {
                                          _gender = 1;
                                        }
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: const CircleBorder()),
                                    child: Icon(
                                      Icons.female_rounded,
                                      size: 40,
                                      color: (_gender != 0)
                                          ? const Color(0xff1776e0)
                                          : const Color(0xff999999),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              (_accountFound == 2)
                                  ? Container(
                                      child: Text(
                                        "Your Email/Password is wrong",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : Container(),
                              SignupTextFeild(
                                icon: Icons.mail,
                                onTap: () {},
                                text_ar: "البريد الإلكتروني",
                                text_en: "Email",
                                textController: _loginEmail,
                              ),
                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {},
                                text_ar: "الرمز السري",
                                text_en: "Password",
                                textController: _loginPass,
                                eyeOfSeeing: true,
                                password: true,
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_isSelected == 0) {
                        if (_password.text.trim() != "" &&
                            _email.text.trim() != "" &&
                            _name.text.trim() != "" &&
                            _birthDate.text.trim() != "") {
                          users.add(UserData(
                            birthDate: _birthDate.text.trim(),
                            email: _email.text.trim(),
                            name: _name.text.trim(),
                            password: _password.text.trim(),
                            token: "54g4g45g45g4g45g",
                            gender: (_gender == 0) ? "Male" : "Female",
                          ));
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "The Account has been created",
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            },
                          ).then(
                            (value) {
                              _password.text = "";
                              _email.text = "";
                              _name.text = "";
                              _birthDate.text = "";
                              user!.name = _name.text;
                              user!.birthDate = _birthDate.text;
                              user!.email = _email.text;
                              user!.password = _password.text;
                            },
                          );
                        }
                      } else {
                        if (_loginEmail.text != "" && _loginPass.text != "") {
                          for (int i = 0; i < users.length; i++) {
                            if (_loginEmail.text.trim() == users[i].email &&
                                _loginPass.text.trim() == users[i].password) {
                              _accountFound = 1;
                              user!.name = users[i].name;
                              user!.birthDate = users[i].birthDate;
                              user!.email = _loginEmail.text;
                              user!.password = _loginEmail.text;
                              user!.notifications = users[i].notifications;
                              user!.image = users[i].image;
                              user!.token = users[i].token;
                            }
                          }
                          if (_accountFound == 1) {
                            Navigator.pop(context, true);
                          } else if (_accountFound == 0) {
                            _accountFound = 2;
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(300))),
                    child: Text(
                      (_isSelected == 0)
                          ? (languageType == 0)
                              ? "إنشاء الحساب"
                              : "Signup"
                          : (languageType == 0)
                              ? "تسجيل الدخول"
                              : "Login",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
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
