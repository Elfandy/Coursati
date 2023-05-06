import 'dart:convert';

import 'package:coursati/Services/ScreenController.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/UserData.dart';
import '../../Widgets/Signin/SignUpTextFeild.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key, required this.contextIn});
  final BuildContext contextIn;

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
  TextEditingController _passRepeat = TextEditingController();
  bool PasswordRepeatCheck = true;

  int _isSelected = 1, _gender = 0, _accountFound = 0, _passOk = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: (isDark) ? Colors.black38 : Colors.white,
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
          color: (isDark) ? Colors.black38 : Colors.white,
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
                                onTap: () {
                                  if (_name.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _name.text.length - 1))) {
                                    _name.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _name.text.length));
                                  }
                                },
                                onChange: (value) {},
                                text_ar: "الاسم",
                                text_en: "Name",
                                textController: _name,
                              ),
                              SignupTextFeild(
                                icon: Icons.mail,
                                onTap: () {
                                  if (_email.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _email.text.length - 1))) {
                                    _email.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _email.text.length));
                                  }
                                },
                                onChange: (value) {},
                                text_ar: "البريد الإلكتروني",
                                text_en: "Email",
                                textController: _email,
                              ),
                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {
                                  if (_password.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _password.text.length - 1))) {
                                    _password.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _password.text.length));
                                  }
                                },
                                onChange: (value) {},
                                text_ar: "الرمز السري",
                                text_en: "Password",
                                textController: _password,
                                eyeOfSeeing: true,
                                password: true,
                              ),
                              //??????????????????????????????????????????????????????????????????????
                              (_passOk == 1)
                                  ? Text(
                                      "passwords are not the same",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Container(),

                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {
                                  if (_passRepeat.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              _passRepeat.text.length - 1))) {
                                    _passRepeat.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _passRepeat.text.length));
                                  }
                                },
                                onChange: (value) {
                                  setState(() {
                                    if (_password.text == value) {
                                      _passOk = 2;
                                    } else {
                                      _passOk = 1;
                                    }
                                  });
                                },
                                text_ar: "تأكيد الرمز السري",
                                text_en: "Confirm password",
                                textController: _passRepeat,
                                eyeOfSeeing: true,
                                password: true,
                              ),
                              //????????????????????????????????????????????????????????????????????????
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
                                // onTapOutSide: (event) {},
                                onChange: (value) {},
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
                                          ? Color.fromARGB(255, 228, 28, 228)
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
                                      child: const Text(
                                        "Your Email/Password is wrong",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : Container(),
                              SignupTextFeild(
                                icon: Icons.mail,
                                onTap: () {
                                  if (_loginEmail.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              _loginEmail.text.length - 1))) {
                                    _loginEmail.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _loginEmail.text.length));
                                  }
                                },
                                onChange: (value) {},
                                text_ar: "البريد الإلكتروني",
                                text_en: "Email",
                                textController: _loginEmail,
                              ),
                              SignupTextFeild(
                                icon: Icons.lock_outline_rounded,
                                onTap: () {
                                  if (_loginPass.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              _loginPass.text.length - 1))) {
                                    _loginPass.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _loginPass.text.length));
                                  }
                                },
                                onChange: (value) {},
                                
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
                            _birthDate.text.trim() != "" &&
                            _passOk == 2) {
                          //????????????????????????????????????????????????????????????????
                          // users.add(UserData(
                          //   birthDate: _birthDate.text.trim(),
                          //   email: _email.text.trim(),
                          //   name: _name.text.trim(),
                          //   password: _password.text.trim(),
                          //   token: "",
                          //   gender: _gender,
                          //   id: 010,
                          // ));
                          register(
                              email: _email.text,
                              birthdate: _birthDate.text,
                              gender: _gender,
                              name: _name.text,
                              password: _password.text);
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text(
                                  "The Account has been created",
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            },
                          ).then(
                            (value) {
                              // _password.text = "";
                              // _email.text = "";
                              // _name.text = "";
                              // _birthDate.text = "";
                              // user.gender = 0;
                              // user.name = _name.text;
                              // user.birthDate = _birthDate.text;
                              // user.email = _email.text;
                              // user.password = _password.text;
                            },
                          );
                          //???????????????????????????????????????????????????????????????????????
                        }
                      } else {
                        if (_loginEmail.text.isNotEmpty &&
                            _loginPass.text.isNotEmpty) {
                          //**** Fetch Token from server */
                          getToken(_loginEmail.text, _loginPass.text)
                              .then((value) {
                            Map<String, dynamic> _userTemp =
                                json.decode(value.toString());
                            user.token = _userTemp["token"];
                            //**** Fetch credintials */
                            getCredintials(user.token).then((value) {
                              Map<String, dynamic> _userCredinitals =
                                  json.decode(value.toString());

                              user.name = _userCredinitals['name'];
                              user.email = _userCredinitals['email'];
                              user.id = _userCredinitals['id'];
                              user.birthDate = _userCredinitals['birthdate'];
                              user.gender = _userCredinitals['gender'];
                              user.image =
                                  "$onlineServer/storage/${_userCredinitals['avatar']}";
                              _accountFound = 1;
                              if (_accountFound == 1) {
                                if (widget.contextIn.widget.toString() ==
                                    "TCNotLogged") {
                                  ScreenController().restartApp(context);
                                } else {
                                  Navigator.pop(context, true);
                                }
                              } else if (_accountFound == 0) {
                                _accountFound = 2;
                              }
                            });
                          });

                          // for (int i = 0; i < users.length; i++) {
                          //   if (_loginEmail.text.trim() == users[i].email &&
                          //       _loginPass.text.trim() == users[i].password) {
                          //     _accountFound = 1;
                          //     user.name = users[i].name;
                          //     user.birthDate = users[i].birthDate;
                          //     user.email = _loginEmail.text;
                          //     user.password = _loginEmail.text;
                          //     user.notifications = users[i].notifications;
                          //     user.image = users[i].image;
                          //     user.token = users[i].token;
                          //     user.trainingCenterId = users[i].trainingCenterId;
                          //     user.gender = users[i].gender;
                          //     FileHandle().writeConfig(ConfigSave);

                          //     //!! this is for filling the data of the training center
                          //     if (user.trainingCenterId != null) {
                          //       for (int i = 0;
                          //           i < trainingCenterData.length;
                          //           i++) {
                          //         if (user.trainingCenterId ==
                          //             trainingCenterData[i].id) {
                          //           TC = trainingCenterData[i];
                          //         }
                          //       }
                          //     }
                          //   }
                          // }
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
                      style: const TextStyle(fontSize: 16, color: Colors.white),
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

  Future getToken(String email, String password) async {
    try {
      return await Dio().post("$onlineServer/api/auth/token",
          data: {"email": email, "password": password});
    } catch (exception) {
      print(exception);
    }
  }

  Future getCredintials(String token) async {
    try {
      return await Dio().get("$onlineServer/api/user",
          options: Options(headers: {'Authorization': "Bearer $token"}));
    } catch (exception) {
      print(exception) {}
    }
  }

//????????????????????????????????????????????????????????????????
  Future register(
      {String email = "",
      String password = "",
      String name = "",
      // int id = 0,
      String birthdate = "",
      int gender = 0}) async {
    try {
      return await Dio().post("$onlineServer/api/register", data: {
        "email": email,
        "password": password,
        "name": name,
        // "id": id,
        "birthdate": DateTime.parse(birthdate)
      });
    } catch (exception) {
      print(exception) {}
    }
  }
  //???????????????????????????????????????????????????????????????????????
}
