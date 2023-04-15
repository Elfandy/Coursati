import 'package:coursati/Screens/main_page.dart';
import 'package:coursati/main.dart';
import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';

List<bool> _selection = [true, false];

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          splashColor: const Color(0xff1776e0),
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff1776e0),
          ),
        ),
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          (languageType == 0) ? "الإعدادات" : "Settings",
          style: const TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(
        color: Colors.white,
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
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                ToggleButtons(
                  splashColor: const Color(0xff1776e0),
                  isSelected: _selection,
                  onPressed: ((index) {
                    setState(() {
                      if (index == 0) {
                        if (_selection[index] == false) {
                          _selection[index] = true;
                          _selection[index + 1] = false;
                          languageType = 0;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainApp(),
                              ));
                        }
                      } else if (index == 1) {
                        if (_selection[index] == false) {
                          _selection[index] = true;
                          _selection[index - 1] = false;
                          languageType = 1;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainApp(),
                              ));
                        }
                      }
                    });
                  }),
                  children: const [Text("AR"), Text("EN")],
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
