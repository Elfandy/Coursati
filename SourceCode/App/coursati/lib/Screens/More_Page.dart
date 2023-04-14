import 'package:coursati/Screens/SubScreen/About.dart';
import 'package:coursati/Screens/SubScreen/Account.dart';
import 'package:coursati/Screens/SubScreen/Settings.dart';
import 'package:coursati/Services/Animations.dart';
import 'package:coursati/Widgets/More/OptionButton.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/UserData.dart';

import '../Widgets/More/FloatingBar.dart';
import '../main.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  UserData user = UserData(
      name: "ريان",
      image:
          "http://192.168.43.126/Images/shrajan_sci_fi_headphones8k_dfdb6871-06d3-44d5-82b3-c983f5e3d4f1.png",
      token:
          "tsdf8a79yt78ft74tg79fg97weasgf79gw987fga0wgf9weg7f9wgf97wgef7wgf83wt47rg348217638915198767193rfg72gf72tgr7fergf987fga79gf79sdgf9asgf7sgfs7g");
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
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      user.image,
                    ),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.name,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const FloatingBar(),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              OptionButton(
                image: const AssetImage("Assets/Icons/user.png"),
                label: (languageType == 0) ? "إدارة الحساب" : "Account",
                labelColor: const Color.fromARGB(255, 65, 65, 65),
                onPressed: () {
                  Navigator.of(context).push(
                    Animations().createRoute(AccountPage(), 1),
                  );
                },
              ),
              OptionButton(
                image: const AssetImage("Assets/Icons/settings.png"),
                label: (languageType == 0) ? "الإعدادات" : "Settings",
                labelColor: const Color.fromARGB(255, 65, 65, 65),
                onPressed: () {
                  Navigator.of(context).push(
                    Animations().createRoute(SettingsPage(), 1),
                  );
                },
              ),
              OptionButton(
                image: const AssetImage("Assets/Icons/about.png"),
                label: (languageType == 0) ? "حول" : "About",
                labelColor: const Color.fromARGB(255, 65, 65, 65),
                onPressed: () {
                  Navigator.of(context).push(
                    Animations().createRoute(AboutPage(), 1),
                  );
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        const Image(
          image: AssetImage("Assets/Images/Startup/Logo.png"),
          height: 150,
        )
      ],
    );
  }
}
