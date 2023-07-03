import 'dart:convert';

import 'package:coursati/Services/ScreenController.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController _phonenumber = TextEditingController();

  int _isSelected = 1,
      _gender = 0,
      _accountFound = 0,
      _passOk = 0,
      _emailCheck = 0,
      _loginemailCheck = 0,
      _passwordCheck = 0,
      _loginpasswordCheck = 0,
      _birthDateCheck = 0,
      _phonenumberCheck = 0;

  bool _nameEmpty = false,
      _emailEmpty = false,
      _loginemailEmpty = false,
      _passEmpty = false,
      _loginpassEmpty = false,
      _passRepeatEmpty = false,
      _phoneNumberEmpty = false,
      _birthDateEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
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

                                _name.text = '';
                                _birthDate.text = '';
                                _password.text = '';
                                _passRepeat.text = '';
                                _email.text = '';
                                _gender = 0;
                                _phonenumber.text = '';

                                //******* reset checks */

                                _emailCheck = 0;
                                _phonenumberCheck = 0;
                                _birthDateCheck = 0;
                                _passwordCheck = 0;

                                //**** reset emptys */

                                _emailEmpty = false;
                                _nameEmpty = false;
                                _birthDateEmpty = false;
                                _passEmpty = false;
                                _passRepeatEmpty = false;
                                _phoneNumberEmpty = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 10, 10),
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
                                _loginEmail.text = '';
                                _loginPass.text = '';
                                _accountFound = 0;
                              });
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 20, 10),
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
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    (_nameEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال الاسم"
                                                  : "Please enter your name ",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    SignupTextFeild(
                                      icon: Icons.person,
                                      onTap: () {
                                        if (_name.selection ==
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _name.text.length -
                                                        1))) {
                                          _name.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset:
                                                          _name.text.length));
                                        }
                                      },
                                      onChange: (value) {},
                                      text_ar: "الاسم",
                                      text_en: "Name",
                                      textController: _name,
                                    ),
                                    (_emailEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال البريد الإلكتروني"
                                                  : "Please enter your email.",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    (_emailCheck == 1)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال بريد إلكتروني صحيح"
                                                  : "Please enter a valid email address",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    (_emailCheck == 2)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "البريج الإلكتروني مسجل مسبقاً"
                                                  : "The email is already registered",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    SignupTextFeild(
                                      icon: Icons.mail,
                                      onTap: () {
                                        if (_email.selection ==
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _email.text.length -
                                                        1))) {
                                          _email.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset:
                                                          _email.text.length));
                                        }
                                      },
                                      onChange: (value) {},
                                      text_ar: "البريد الإلكتروني",
                                      text_en: "Email",
                                      textController: _email,
                                    ),
                                    (_phoneNumberEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال رقم الهاتف"
                                                  : "Please Enter your phone number",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    (_phonenumberCheck == 1)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال رقم هاتف صحيح"
                                                  : "Please enter a valid phone number",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    SignupTextFeild(
                                      icon: Icons.phone,
                                      maxLingth: 10,
                                      numbers: true,
                                      onTap: () {
                                        if (_phonenumber.selection ==
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _phonenumber
                                                            .text.length -
                                                        1))) {
                                          _loginEmail.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _phonenumber
                                                          .text.length));
                                        }
                                      },
                                      onChange: (value) {},
                                      text_ar: "رقم الهاتف الشخصي",
                                      text_en: "Personal phone number",
                                      textController: _phonenumber,
                                    ),
                                    (_passEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال الرمز السري"
                                                  : "Please enter your password",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    (_passwordCheck == 1)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرمز السري يجب ان يكون اكثر من 8 احرف"
                                                  : "Password Need to be more than 8 characters",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    SignupTextFeild(
                                      icon: Icons.lock_outline_rounded,
                                      onTap: () {
                                        if (_password.selection ==
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset:
                                                        _password.text.length -
                                                            1))) {
                                          _password.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _password
                                                          .text.length));
                                        }
                                      },
                                      onChange: (value) {},
                                      text_ar: "الرمز السري",
                                      text_en: "Password",
                                      textController: _password,
                                      eyeOfSeeing: true,
                                      password: true,
                                      maxLingth: 32,
                                    ),
                                    //??????????????????????????????????????????????????????????????????????
                                    (_passOk == 1)
                                        ? Text(
                                            languageType == 0
                                                ? "الرمزين غير متطابقين الرجاء التأكد من الرمز السري "
                                                : "The two password are not the same please check the password",
                                            style: TextStyle(color: Colors.red),
                                          )
                                        : Container(),
                                    (_passRepeatEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال الرمز السري مرة أخرى"
                                                  : "please enter your password again",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    SignupTextFeild(
                                      icon: Icons.lock_outline_rounded,
                                      onTap: () {
                                        if (_passRepeat.selection ==
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _passRepeat
                                                            .text.length -
                                                        1))) {
                                          _passRepeat.selection =
                                              TextSelection.fromPosition(
                                                  TextPosition(
                                                      offset: _passRepeat
                                                          .text.length));
                                        }
                                      },
                                      onChange: (value) {},
                                      text_ar: "تأكيد الرمز السري",
                                      text_en: "Confirm password",
                                      textController: _passRepeat,
                                      eyeOfSeeing: true,
                                      password: true,
                                    ),
                                    //????????????????????????????????????????????????????????????????????????
                                    (_birthDateEmpty)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "الرجاء إدخال الميلاد"
                                                  : "please enter your birthDate",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),
                                    (_birthDateCheck == 1)
                                        ? Container(
                                            child: Text(
                                              languageType == 0
                                                  ? "يجب ان تكون اكبر من 10 سنوات لإنشاء حساب"
                                                  : "You have to be older than 10 years old to register",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : Container(),

                                    SignupTextFeild(
                                      icon: Icons.calendar_today,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                initialDate: DateTime(2000)
                                                //     .subtract(
                                                //   Duration(days: 2190),
                                                // ),
                                                ,
                                                lastDate: DateTime.now());

                                        if (pickedDate != null) {
                                          String foramteDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);

                                          setState(() {
                                            _birthDate.text = foramteDate;
                                          });
                                        }
                                      },
                                      // onTapOutSide: (event) {},
                                      onChange: (value) {},
                                      text_ar: "الميلاد",
                                      text_en: "Birth Date",
                                      textController: _birthDate,
                                      readOnly: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                ? const Color.fromARGB(
                                                    255, 228, 28, 228)
                                                : const Color(0xff999999),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  (_accountFound == 2)
                                      ? Container(
                                          child: Text(
                                            languageType == 0
                                                ? "بيانات الدخول خاطئة الرجاء التأكد من بياناتك"
                                                : "Your Email/Password is wrong",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  (_loginemailEmpty)
                                      ? Container(
                                          child: Text(
                                            languageType == 0
                                                ? "الرجاء إدخال البريد الإلكتروني"
                                                : "Please enter your email.",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  (_loginemailCheck == 1)
                                      ? Container(
                                          child: Text(
                                            languageType == 0
                                                ? "الرجاء إدخال بريد إلكتروني صحيح"
                                                : "Please enter a valid email address",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  SignupTextFeild(
                                    icon: Icons.mail,
                                    onTap: () {
                                      if (_loginEmail.selection ==
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset:
                                                      _loginEmail.text.length -
                                                          1))) {
                                        _loginEmail.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _loginEmail
                                                        .text.length));
                                      }
                                    },
                                    onChange: (value) {},
                                    text_ar: "البريد الإلكتروني",
                                    text_en: "Email",
                                    textController: _loginEmail,
                                  ),
                                  (_loginpassEmpty)
                                      ? Container(
                                          child: Text(
                                            languageType == 0
                                                ? "الرجاء إدخال الرمز السري"
                                                : "Please enter your password",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  (_loginpasswordCheck == 1)
                                      ? Container(
                                          child: Text(
                                            languageType == 0
                                                ? "الرمز السري يجب ان يكون اكثر من 8 احرف"
                                                : "Password Need to be more than 8 characters",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  SignupTextFeild(
                                    icon: Icons.lock_outline_rounded,
                                    onTap: () {
                                      if (_loginPass.selection ==
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset:
                                                      _loginPass.text.length -
                                                          1))) {
                                        _loginPass.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: _loginPass
                                                        .text.length));
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
                        onPressed: () async {
                          ///********************                   Validations           */
                          if (_isSelected == 0) {
                            setState(() {
                              //****************************** This is to check if the fields are empty or not */
                              if (_password.text.trim().isEmpty) {
                                _passEmpty = true;
                              } else {
                                _passEmpty = false;
                              }
                              if (_passRepeat.text.trim().isEmpty) {
                                _passRepeatEmpty = true;
                              } else {
                                _passRepeatEmpty = false;
                              }
                              if (_email.text.trim().isEmpty) {
                                _emailEmpty = true;
                              } else {
                                _emailEmpty = false;
                              }
                              if (_name.text.trim().isEmpty) {
                                _nameEmpty = true;
                              } else {
                                _nameEmpty = false;
                              }
                              if (_birthDate.text.trim().isEmpty) {
                                _birthDateEmpty = true;
                              } else {
                                _birthDateEmpty = false;
                              }
                              if (_phonenumber.text.trim().isEmpty) {
                                _phoneNumberEmpty = true;
                              } else {
                                _phoneNumberEmpty = false;
                              }

                              //****************** This is to check if the password and the reapeated one are the same */
                              if (_password.text == _passRepeat.text) {
                                _passOk = 2;
                              } else {
                                _passOk = 1;
                              }
                            });
                            if (!_passEmpty &&
                                !_birthDateEmpty &&
                                !_nameEmpty &&
                                !_emailEmpty &&
                                !_phoneNumberEmpty &&
                                !_passRepeatEmpty) {
                              setState(() {
                                //*************************   BirthDate check if it's more than 10 years old */
                                if (!DateTime.parse(_birthDate.text).isBefore(
                                    DateTime.now()
                                        .subtract(Duration(days: 3652)))) {
                                  _birthDateCheck = 1;
                                } else {
                                  _birthDateCheck = 0;
                                }

                                //************************   Email check if it's valid email address */
                                if (!(_email.text.contains("@") &&
                                    _email.text.contains(".") &&
                                    _email.text.indexOf("@") <
                                        _email.text.indexOf(".") &&
                                    _email.text.lastIndexOf("@") ==
                                        _email.text.indexOf("@"))) {
                                  _emailCheck = 1;
                                } else {
                                  _emailCheck = 0;
                                }

                                //*************************   Phone number check if it's a valid phone number */

                                if (!(_phonenumber.text.startsWith("091") ||
                                    _phonenumber.text.startsWith("092") ||
                                    _phonenumber.text.startsWith("094") ||
                                    _phonenumber.text.startsWith("095") ||
                                    _phonenumber.text.startsWith("093"))) {
                                  _phonenumberCheck = 1;
                                } else {
                                  _phonenumberCheck = 0;
                                }
                                //************************       Password check if it's mpre than 8 characters */
                                if (_password.text.length < 8) {
                                  _passwordCheck = 1;
                                } else {
                                  _passwordCheck = 0;
                                }
                              });

                              //*************************** This is to check that everything is ok */
                              if (_birthDateCheck == 0 &&
                                  _emailCheck == 0 &&
                                  _phonenumberCheck == 0 &&
                                  _passwordCheck == 0 &&
                                  _passOk == 2) {
                                var result = await register(
                                    email: _email.text,
                                    birthdate: _birthDate.text,
                                    gender: _gender,
                                    name: _name.text,
                                    password: _password.text,
                                    phonenum: _phonenumber.text);
                                if (result != null) {
                                  if (result) {
                                    Fluttertoast.showToast(
                                        msg: languageType == 0
                                            ? "تم إنشاء الحساب بنجاح"
                                            : "The Account Created succefully");
                                    setState(() {
                                      _name.text = '';
                                      _birthDate.text = '';
                                      _password.text = '';
                                      _passRepeat.text = '';
                                      _email.text = '';
                                      _gender = 0;
                                      _phonenumber.text = '';

                                      //******* reset checks */

                                      _emailCheck = 0;
                                      _phonenumberCheck = 0;
                                      _birthDateCheck = 0;
                                      _passwordCheck = 0;

                                      //**** reset emptys */

                                      _emailEmpty = false;
                                      _nameEmpty = false;
                                      _birthDateEmpty = false;
                                      _passEmpty = false;
                                      _passRepeatEmpty = false;
                                      _phoneNumberEmpty = false;
                                    });
                                  } else {
                                    setState(() {
                                      _emailCheck = 2;
                                    });
                                  }
                                }
                              }
                            }
                            //********************************** The Login Side /////////
                          } else {
                            setState(() {
                              if (_loginEmail.text.isEmpty) {
                                _loginemailEmpty = true;
                              } else {
                                _loginemailEmpty = false;
                              }
                              if (_loginPass.text.isEmpty) {
                                _loginpassEmpty = true;
                              } else {
                                _loginpassEmpty = false;
                              }
                            });
                            if (_loginEmail.text.isNotEmpty &&
                                _loginPass.text.isNotEmpty) {
                              setState(() {
                                if (!(_loginEmail.text.contains("@") &&
                                    _loginEmail.text.contains(".") &&
                                    _loginEmail.text.indexOf("@") <
                                        _loginEmail.text.indexOf(".") &&
                                    _loginEmail.text.lastIndexOf("@") ==
                                        _loginEmail.text.indexOf("@"))) {
                                  _loginemailCheck = 1;
                                } else {
                                  _loginemailCheck = 0;
                                }
                                if (_loginPass.text.length < 8) {
                                  _loginpasswordCheck = 1;
                                } else {
                                  _loginpasswordCheck = 0;
                                }
                              });
                              if (_loginemailCheck == 0 &&
                                  _loginpasswordCheck == 0) {
                                //**** Fetch Token from server */
                                var token = await getToken(
                                    _loginEmail.text, _loginPass.text);
                                if (token != null && token != "'message':'0'") {
                                  user.token = token["token"];

                                  //**** Fetch credintials */
                                  var userCredinitals =
                                      await getCredintials(user.token);

                                  user.name = userCredinitals['name'];
                                  user.email = userCredinitals['email'];
                                  user.id = userCredinitals['id'];

                                  user.birthDate = userCredinitals['birthdate'];

                                  user.gender = userCredinitals['gender'];
                                  user.phoneNumber =
                                      userCredinitals['phonenumber'];
                                  user.hasTC = userCredinitals['hasTC'];
                                  user.personalID =
                                      userCredinitals['passportID'].toString();
                                  user.image = "${userCredinitals['avatar']}";
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
                                } else {
                                  setState(
                                    () {
                                      _accountFound = 2;
                                    },
                                  );
                                }
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
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getToken(String email, String password) async {
    var url = "auth/token";
    try {
      var response = await dioTestApi.post(url,
          data: {"email": email, "password": password, "deviceID": deviceID});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Fluttertoast.showToast(
            msg: languageType == 0
                ? "هناك خطاء في الخادم الرجاء المحاولة لاحقاً"
                : "There is an error with the server try again later");
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  Future getCredintials(String token) async {
    var url = "user";
    try {
      var response = await dioTestApi.post(url,
          options: Options(headers: {'Authorization': "Bearer $token"}));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Fluttertoast.showToast(
            msg: languageType == 0
                ? "هناك خطاء في الخادم الرجاء المحاولة لاحقاً"
                : "There is an error with the server try again later");
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }

//????????????????????????????????????????????????????????????????
  Future register(
      {required String email,
      required String password,
      required String name,
      required String birthdate,
      required int gender,
      required String phonenum}) async {
    try {
      var response = await dioTestApi.post("register", data: {
        "email": email,
        "password": password,
        "name": name,
        "birthdate": birthdate,
        "gender": gender,
        "phonenumber": phonenum
      });
      if (response.statusCode == 200) {
        if (response.data != 'email') {
          return true;
        } else {
          return false;
        }
      }
    } catch (exception) {
      if (kDebugMode) {
        Fluttertoast.showToast(
            // msg: "There was an error using this data please check your data");
            msg: exception.toString());
      }
    }
  }
  //???????????????????????????????????????????????????????????????????????
}
