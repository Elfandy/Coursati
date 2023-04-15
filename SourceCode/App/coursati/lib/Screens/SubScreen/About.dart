import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "حول" : "About",
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              (languageType == 0)
                  ? "Assets/Icons/Logo_arabic.png"
                  : "Assets/Icons/Logo.png",
              scale: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: Text(
                (languageType == 0)
                    ? "كورساتي هي منصة للتجميع جميع مراكز التدريب و كورساتهم في مكان واحد للمساعدة في تسهيل عملية البحث و الإنضمام لها"
                    : "Coursati is a platform for collecting and viewing the Training centers and there courses in one platform to help eas the search for the right course to enroll in",
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            // Text(appName!),
          ],
        ),
      ),
    );
  }
}
