import 'package:coursati/Screens/SubScreen/NotificationPage.dart';
import 'package:coursati/main.dart';
import 'package:flutter/material.dart';

import '../../Screens/SubScreen/FavoritePage.dart';
import '../../Services/Animations.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({super.key});

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                Animations().createRoute(
                  NotificationPage(),1
                ),
              );
            },
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(110, 100),
              ),
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              alignment: Alignment.center,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    "Assets/Icons/Bill.png",
                  ),
                  height: 30,
                ),
                Text(
                  (languageType == 0) ? "الإشعارات" : "Notification",
                  style: TextStyle(
                    height: 2,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // const VerticalDivider(),
          TextButton(
            onPressed: () {
              Animations().createRoute(
                FavoritePage(),1
              );
            },
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(110, 100),
              ),
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              alignment: Alignment.center,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("Assets/Icons/Fav.png"),
                  height: 30,
                ),
                Text(
                  (languageType == 0) ? "المفضلة" : "Favorite",
                  style: TextStyle(
                    height: 2.3,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
