import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Classes/UserData.dart';
import '../../Services/ScreenController.dart';
import '../../Widgets/More/RoundedSigninButton.dart';
import '../../Widgets/Signin/SignUpTextFeild.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  int gender = 0;
  bool showPass = false;
  bool loginable = false;

  Widget? _myWidget;
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Container(
        height: (MediaQuery.of(context).size.height / 2.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      gender = 0;
                    });
                  },
                  child: Icon(
                    Icons.male_rounded,
                    color: (gender == 0)
                        ? const Color(0xff1776e0)
                        : const Color(0xff999999),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      gender = 1;
                    });
                  },
                  child: Icon(
                    Icons.female_rounded,
                    color: (gender == 1)
                        ? const Color(0xff1776e0)
                        : const Color(0xff999999),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //* -----------------------------------------------------------

      //? This is the variable for login
      Container(
        height: (MediaQuery.of(context).size.height / 4.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignupTextFeild(
              icon: Icons.email_outlined,
              text: loginEmail,
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
              text: loginpassword,
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
          ],
        ),
      ),
    ];

    _myWidget = _widgets[picker];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        //* piture box background
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 1.6),
              child: Column(children: []),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "Assets/Images/priscilla-unsplash.jpg",
                ),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 1.6),
              decoration: const BoxDecoration(color: Color(0x44000000)),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: (languageType == 0)
                          ? const EdgeInsets.fromLTRB(0, 25, 20, 0)
                          : const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: (languageType == 0)
                          ? const EdgeInsets.fromLTRB(0, 0, 20, 0)
                          : const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            (languageType == 0)
                                ? "أهلا${(login) ? " من" : " بك في"}"
                                : "Welcome${(login) ? "" : " to"}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1776e0),
                              // fontFamily: "Suravaram",
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 3),
                              ],
                            ),
                          ),
                          Container(
                            child: (login)
                                ? Text(
                                    (languageType == 0) ? " جديد," : " Back,",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      // fontFamily: "Suravaram",
                                      shadows: [
                                        Shadow(
                                            color: Colors.black, blurRadius: 3),
                                      ],
                                    ),
                                  )
                                : Text(
                                    (languageType == 0)
                                        ? " كورساتي,"
                                        : " Coursati,",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      // fontFamily: "Suravaram",
                                      shadows: [
                                        Shadow(
                                            color: Colors.black, blurRadius: 3),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: (languageType == 0)
                          ? const EdgeInsets.fromLTRB(0, 3, 20, 10)
                          : const EdgeInsets.fromLTRB(20, 3, 0, 10),
                      child: Row(children: [
                        Text(
                          (languageType == 0)
                              ? (login)
                                  ? "سجل دخولك للاستمرار"
                                  : "أنشىء حساب للاستمرار"
                              : (login)
                                  ? "Sginin to Continue"
                                  : "Signup to Continue",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            // fontFamily: "Suravaram",
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 3),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        //* grey background box
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color(0xffdddddd),
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 1.9),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 1.9),
                  child: Image(
                    image: AssetImage(
                      (languageType == 0)
                          ? "Assets/Icons/Coursati_arabic.png"
                          : "Assets/Logo/Coursati.png",
                    ),
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        //*Here is where the floating box will be
        Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: (login) ? 250 : 150,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 1.1),
                    height: (login)
                        ? (MediaQuery.of(context).size.height / 1.9)
                        : (MediaQuery.of(context).size.height / 1.4),
                    child: Stack(children: [
                      //* size of the floating box
                      Container(
                          height: (login)
                              ? ((MediaQuery.of(context).size.height / 1.9) -
                                  60)
                              : ((MediaQuery.of(context).size.height / 1.4) -
                                  60),
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
                                            picker = 1;
                                            _myWidget = _widgets[picker];
                                            login = !login;
                                          }
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        padding: (languageType == 0)
                                            ? const EdgeInsets.fromLTRB(
                                                0, 15, 20, 2)
                                            : const EdgeInsets.fromLTRB(
                                                20, 20, 2, 0),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            (languageType == 0)
                                                ? "تسجيل الدخول"
                                                : "LOGIN",
                                            style: TextStyle(
                                              fontSize:
                                                  (languageType == 0) ? 20 : 32,
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
                                            picker = 0;
                                            _myWidget = _widgets[picker];
                                            login = !login;
                                          }
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        padding: (languageType == 0)
                                            ? const EdgeInsets.fromLTRB(
                                                20, 15, 0, 2)
                                            : const EdgeInsets.fromLTRB(
                                                2, 20, 20, 0),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            (languageType == 0)
                                                ? "إنشاء حساب"
                                                : "SIGNUP",
                                            style: TextStyle(
                                              fontSize:
                                                  (languageType == 0) ? 20 : 32,
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

                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 100),
                                child: _myWidget,
                              ),
                            ],
                          )),
                      //*this is the rounded button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedSigninButton(onPressed: () {
                          setState(() {
                            if (picker == 1) {
                              if (loginEmail.text != "" &&
                                  loginpassword.text != "") {
                                for (int i = 0; i < users.length; i++) {
                                  if (users[i].email == loginEmail.value.text &&
                                      users[i].password == loginpassword.text) {
                                    user!.birthDate == users[i].birthDate;
                                    user!.name == users[i].name;
                                    user!.token ==
                                        "1321241129re87y1f7g3r791g7f9g129fg1";
                                    user!.email == users[i].email;
                                    user!.image == users[i].image;

                                    ScreenController().restartApp(context);
                                  }
                                }
                              }
                            } else {
                              if (email.text != "" &&
                                  password.text != "" &&
                                  name.text != "" &&
                                  date.text != "") {
                                user!.birthDate == date.text;
                                user!.name == name.text;
                                user!.token ==
                                    "1321241129re87y1f7g3r791g7f9g129fg1";
                                user!.email == email.text;

                                users.add(UserData(
                                    birthDate: date.text,
                                    email: email.text,
                                    password: password.text,
                                    name: name.text));
                                ScreenController().restartApp(context);
                              }
                            }
                          });
                        }),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            //*position of the rounded button with the floating box
          ],
        )
      ]),
    );
  }
}
