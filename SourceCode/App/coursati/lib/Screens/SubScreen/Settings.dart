import 'package:coursati/Services/Controller/FileHandle.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Classes/UserData.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _change = 0, _langpicker = languageType;
  bool themeMode = isDark;

  @override
  Widget build(BuildContext context) {
    languageSelector = (_langpicker == 0) ? [true, false] : [false, true];
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
                  isSelected: languageSelector!,
                  onPressed: ((index) {
                    setState(() {
                      if (index == 0) {
                        _langpicker = 0;
                        _change++;
                      } else if (index == 1) {
                        _change++;
                        _langpicker = 1;
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
                const SizedBox(
                  width: 10,
                ),
                Text(
                  (languageType == 0) ? "الوضع الليلي" : "Dark Mode",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Switch(
                  onChanged: (value) {
                    setState(() {
                      themeMode = !themeMode;

                      _change++;
                    });
                  },
                  value: themeMode,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),

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
              onPressed: () async {
                if (_change > 0) {
                  if (_langpicker == 0) {
                    languageType = 0;
                  } else if (_langpicker == 1) {
                    languageType = 1;
                  }
                  isDark = themeMode;

                  FileHandle().writeConfig(ConfigSave);

                  // saveConfig(isDark, languageType);
                  ScreenController().restartApp(context);
                }
              },
              child: Text(
                (languageType == 0) ? "حفظ" : "Save",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
