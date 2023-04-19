import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Classes/GlobalVariables.dart';
import 'Classes/UserData.dart';
import 'Screens/main_page.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Widgets/ErrorServer.dart';

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

void main() async {
//*----------------------------------------
  // runZonedGuarded(() async {
// Here
  // WidgetsFlutterBinding.ensureInitialized();
  // getlanguage();
  // getDarkMode();

  //!!! This is for checking the connection to the server
  checkServer().then((value) {
    if (value==1) {
      runApp(const MainApp());
    } else {
      runApp( ServerError(error:value));
    }
  });

  // }, (_, s) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* This is for the config file

    // // print("bye");
    // isDark ??= false;
    // languageType ??= 0;

   
    //! This line here is for activating reading and writing from files
    // context.read<FileController>().readConfig();
    // String fileData =
    //     context.select((FileController controller) => controller.text);
    // if (fileData != "") {
    //   isDark = fileData
    //           .substring(
    //               fileData.indexOf(":", fileData.indexOf("darkMode:")) + 1,
    //               fileData.indexOf(",", fileData.indexOf("darkMode:")))
    //           .toLowerCase() ==
    //       "true";

    //   languageType = int.parse(fileData.substring(9, 10));
    //   print(isDark.toString() + languageType.toString() + "bye");
    // } else {
    //   isDark = false;
    //   languageType = 0;
    //   context
    //       .read<FileController>()
    //       .writeConfig("language:$languageType,\ndarkMode:${isDark!},");
    //   print(isDark.toString() + languageType.toString() + "hello");
    // }

//! this is for shared prefrences test

//??????????????????????????????????????????????????????????????
    languageSelector = (languageType == 0) ? [true, false] : [false, true];

    return MaterialApp(
      title: (languageType == 0) ? "كورساتي" : "Coursati",
      debugShowCheckedModeBanner: false,
      // home: const MainPage(),
      home: MainPage(),

      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: local,
      locale: local[languageType ??= 0],
      theme: ThemeData(
        colorScheme: const ColorScheme(
            //*This is the background of the app
            background: Colors.white,
            brightness: Brightness.light,
            error: Colors.red,
            onBackground: Colors.amber,
            onError: Colors.cyan,
            //*This Color is for Text And Alike
            onPrimary: Color(0xff555555),
            onSecondary: Colors.amber,
            //* This Color is for disabled buttons and stuff
            onSurface: Color(0xff999999),
            //*This Color is For buttons and stuff like this
            primary: Color(0xff1776e0),
            //*This Colors is For Splash
            secondary: Color(0xff1776e0),
            surface: Colors.white),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
        ),
        fontFamily: "Tajawal",
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
            //*This is the background of the app
            background: Color(0xff424242),
            brightness: Brightness.dark,
            error: Colors.red,
            onBackground: Colors.amber,
            onError: Colors.cyan,
            //*This Color is for Text And Alike
            onPrimary: Color(0xff555555),
            onSecondary: Colors.amber,
            //* This Color is for disabled buttons and stuff
            onSurface: Color(0xff999999),
            //*This Color is For buttons and stuff like this
            primary: Color(0xff1776e0),
            //*This Colors is For Splash
            secondary: Color(0xff1776e0),
            surface: Color(0xff424242)),
      ),
      themeMode: themeSelector[(isDark!) ? 1 : 0],
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

saveConfig(bool dark, int lang) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("Language", lang);
  prefs.setBool("DarkMode", dark);
}

Future getlanguage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  int? test = prefs.getInt("Language");
bool? test1 = prefs.getBool("DarkMode");
  isDark = test1 ??= false;
  languageType = test ??= 0;
}

Future getDarkMode() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
}

Future<int> checkServer() async {
  http.Response response;
  try {
    response = await http.get(Uri.parse(server));
  } catch (e) {
    return 0;
  }
  if (response.statusCode == 200) {
    return 1;
  } else {
    return 2;
  }
}
