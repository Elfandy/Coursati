import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Widgets/More/RoundedSigninButton.dart';
import '../../Widgets/More/FloatingSigninBox.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

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
        FloatingSigninBox(),
      ]),
    );
  }
}
