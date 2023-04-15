import 'package:coursati/Screens/SubScreen/About.dart';
import 'package:coursati/Screens/SubScreen/Account.dart';
import 'package:coursati/Screens/SubScreen/Settings.dart';
import 'package:coursati/Services/Animations.dart';
import 'package:coursati/Widgets/More/OptionButton.dart';
import 'package:flutter/material.dart';
import 'package:coursati/Classes/UserData.dart';
import '../Classes/GlobalVariables.dart';
import '../Widgets/More/AvatarGuestMore.dart';
import '../Widgets/More/AvatarMore.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/Images/more_background.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: (user!.token != "")
                  ? (MediaQuery.of(context).size.height / 2.6)
                  : (MediaQuery.of(context).size.height / 3.3),
              width: double.infinity,
              child: (user!.token != "")
                  ? AvatarMore(
                      user: user!,
                    )
                  : const AvatarGuestMore(),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                child: (user!.token != "")
                    ? OptionButton(
                        image: const AssetImage("Assets/Icons/user.png"),
                        label: (languageType == 0) ? "إدارة الحساب" : "Account",
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                            Animations().createRoute(const AccountPage(), 1),
                          )
                              .then(
                            (value) {
                              setState(() {});
                            },
                          );
                        },
                      )
                    : Container(),
              ),
              OptionButton(
                image: const AssetImage("Assets/Icons/settings.png"),
                label: (languageType == 0) ? "الإعدادات" : "Settings",
                onPressed: () {
                  Navigator.of(context).push(
                    Animations().createRoute(const SettingsPage(), 1),
                  );
                },
              ),
              OptionButton(
                image: const AssetImage("Assets/Icons/about.png"),
                label: (languageType == 0) ? "حول" : "About",
                onPressed: () {
                  Navigator.of(context).push(
                    Animations().createRoute(const AboutPage(), 1),
                  );
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        Image(
          image: const AssetImage("Assets/Icons/Logo.png"),
          height: (MediaQuery.of(context).size.height / 6),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
