import 'package:flutter/material.dart';
import 'Screens/main_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

List<Locale> local = const [
  Locale('ar', 'AE'),
  Locale("en", "US"),
];
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coursati",
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: local,
      locale: local[0],
      theme: ThemeData(fontFamily: "Tajawal"),
    );
  }
}
