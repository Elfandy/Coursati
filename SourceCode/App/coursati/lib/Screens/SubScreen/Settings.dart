import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int change = 0;
  @override
  Widget build(BuildContext context) {
    return
        //* This is for hanfling backButton event
        Scaffold(
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
          (languageType == 0) ? "الإعدادات" : "Settings",
        ),
      ),
      body: Container(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  (languageType == 0) ? "اللغة" : "Language",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                ToggleButtons(
                  isSelected:
                      (languageType == 0) ? [true, false] : [false, true],
                  onPressed: ((index) {
                    setState(() {
                      if (index == 0) {
                        if (languageSelector![index] == false) languageType = 0;
                        languageSelector![index] = true;
                        languageSelector![index + 1] = false;
                        change++;
                      } else if (index == 1) {
                        languageSelector![index] = true;
                        languageSelector![index - 1] = false;
                        languageType = 1;
                        change++;
                      }
                    });
                  }),
                  children: const [Text("AR"), Text("EN")],
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            Row(
              children: [
                const Text("hello"),
                const Spacer(),
                Switch(
                  onChanged: (value) {
                    setState(() {
                      isDark = !isDark!;
                      if (isDark!) {
                        themeMode = 1;
                        change++;
                      } else {
                        themeMode = 0;
                        change++;
                      }
                    });
                  },
                  value: isDark!,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            Text((languageSelector![0]) ? "hello" : "bye"),
            //*! last Thing in the page
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(160, 40),
                  ),
                  elevation: MaterialStatePropertyAll(10),
                  alignment: Alignment.center,
                  shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200))))),
              onPressed: () {
                if (change > 0) {
                  ScreenController().restartApp(context);
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 26),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
