import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';
import '../../Widgets/More/RoundedSigninButton.dart';
import '../../Widgets/More/FloatingSigninBox.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});
  bool login = false;
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                                ? "أهلا${(widget.login) ? " من" : " بك في"}"
                                : "Welcome${(widget.login) ? "" : " to"}",
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
                            child: (widget.login)
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
                              ? (widget.login)
                                  ? "سجل دخولك للاستمرار"
                                  : "أنشىء حساب للاستمرار"
                              : (widget.login)
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

        Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: (widget.login)
                  ? (MediaQuery.of(context).size.height / 4)
                  : (MediaQuery.of(context).size.height / 6),
              child: const SizedBox(
                width: double.infinity,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: (widget.login)
                  ? (MediaQuery.of(context).size.height / 2.1)
                  : (MediaQuery.of(context).size.height / 1.35),
              child: Container(
                width: (MediaQuery.of(context).size.width / 1.1),
                child: Stack(children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: (widget.login)
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
                                        if (!widget.login) {
                                          widget.login = !widget.login;
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
                                            color: (!widget.login)
                                                ? const Color(0xffdddddd)
                                                : const Color(0xff000088),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: (widget.login)
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
                                        if (widget.login) {
                                          widget.login = !widget.login;
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
                                            color: (widget.login)
                                                ? const Color(0xffdddddd)
                                                : const Color(0xff000088),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: (!widget.login)
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
                            FloatingSigninBox(),
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
        )
      ]),
    );
  }
}
