import 'dart:async';
import 'dart:convert';

import 'package:coursati/Classes/UserData.dart';
import 'package:coursati/Services/Controller/FileHandle.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
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

void main() async {
//*----------------------------------------
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    //!!! This is for checking the connection to the server
    //?????????????????????????????????????????????????????????
    // checkServer().then((value) {
    //   if (value==1) {
    //      FileHandle().readConfig().then(
    //   (value) {
    //     if (value != null) {
    //       FileHandle().extractConfigData(value);
    //     } else {
    //       FileHandle().writeConfig(ConfigSave);
    //     }
    runApp(const MainApp());
    //   },
    // );
    //   } else {
    //     runApp( ServerError(error:value));
    //   }
    // });
//! This is the temp run remove it

//* this is the local saving restore function
  }, (_, s) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    languageSelector = (languageType == 0) ? [true, false] : [false, true];

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
      locale: local[languageType],
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
            onPrimary: Color.fromARGB(255, 104, 104, 104),
            onSecondary: Colors.amber,
            //* This Color is for disabled buttons and stuff
            onSurface: Color(0xff999999),
            //*This Color is For buttons and stuff like this
            primary: Color(0xff1776e0),
            //*This Colors is For Splash
            secondary: Color(0xff1776e0),
            surface: Color(0xff424242)),
      ),
      themeMode: themeSelector[(isDark) ? 1 : 0],
    );
  }
}
