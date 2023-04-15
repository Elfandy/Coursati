import 'package:flutter/material.dart';
import 'Classes/GlobalVariables.dart';
import 'Screens/main_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

//////////////////////////////////////////////////////////////////
////
///
/////
////
///
///
///
///
///
///
List<Locale> local = const [
  Locale('ar', 'AE'),
  Locale("en", "US"),
];
void main() {
  languageType = 0;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: (languageType == 0) ? "كورساتي" : "Coursati",
      debugShowCheckedModeBanner: false,
      // home: const MainPage(),
      home: const MainPage(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: local,
      locale: local[languageType!],
      theme: ThemeData(
        fontFamily: "Tajawal",
      ),
    );
  }

//////////////////////////////////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Container(
//         child: Center(
//           child: Image.asset("Assets/Images/Startup/Logo.png"),
//         ),
//       ),
//       nextScreen: const MainPage(),
//       backgroundColor: const Color(0xff1776e0),
//       splashIconSize: 280,
//       splashTransition: SplashTransition.fadeTransition,
//     );
//   }
// }

  // ! deprected Functions here

  // Future<Widget> _checkConnection() async {
  //   Widget w = Scaffold(
  //       body: Container(
  //     child: Text("hello world"),
  //   ));
  //   await Socket.connect("192.168.43.126", 80, timeout: Duration(seconds: 5))
  //       .then((socket) {
  //     w = const MainPage();
  //     socket.destroy();
  //   }).catchError((error) {
  //     w = Scaffold(
  //       body: Container(
  //         child: Text("hello world"),
  //       ),
  //     );
  //   });
  //   return w;
  // }

  //////
  ///
  ///
  ///
  // Future<bool> _checkConnection() async {
  //   bool w = false;
  //   await Socket.connect("192.168.43.126", 80, timeout: Duration(seconds: 5))
  //       .then((socket) {
  //     w = true;
  //     socket.destroy();
  //   }).catchError((error) {
  //     w = false;
  //   });
  //   return w;
  // }

  // Widget _assignAfterConnsection() {
  //   Widget w = Scaffold(
  //     body: Container(
  //       child: Text("hello world"),
  //     ),
  //   );
  //   _checkConnection().then((value) => {
  //         if (value)
  //           {
  //             w = const MainPage(),
  //           }
  //       });

  //   return w;
  // }
}
