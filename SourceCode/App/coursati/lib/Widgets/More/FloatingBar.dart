import 'package:coursati/Screens/SubScreen/NotificationPage.dart';
import 'package:flutter/material.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Screens/SubScreen/FavoritePage.dart';
import '../../Services/Animations.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({super.key, required this.notificationCount});

  final int notificationCount;
  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 90,
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.light)
            ? Colors.white
            : Colors.grey[800],
        boxShadow: const [
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
                  const NotificationPage(),
                  1,
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
                Container(
                  child: (widget.notificationCount <= 0)
                      ? Image(
                          image: const AssetImage(
                            "Assets/Icons/Bill.png",
                          ),
                          height: 30,
                          color:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? Colors.black
                                  : Colors.white,
                        )
                      : Stack(children: [
                          Image(
                            image: const AssetImage(
                              "Assets/Icons/Bill.png",
                            ),
                            height: 30,
                            color: (Theme.of(context).brightness ==
                                    Brightness.light)
                                ? Colors.black
                                : Colors.white,
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.deepOrangeAccent,
                            child: Text(
                              (widget.notificationCount > 99)
                                  ? "+99"
                                  : widget.notificationCount.toString(),
                              style: TextStyle(
                                  fontSize: 8,
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark)
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          )
                        ]),
                ),
                Text(
                  (languageType == 0) ? "الإشعارات" : "Notification",
                  style: TextStyle(
                    height: 2,
                    fontSize: 10,
                    color: (Theme.of(context).brightness == Brightness.light)
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // const VerticalDivider(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                Animations().createRoute(
                  const FavoritePage(),
                  1,
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
                  image: const AssetImage("Assets/Icons/Fav.png"),
                  height: 30,
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.black
                      : Colors.white,
                ),
                Text(
                  (languageType == 0) ? "المفضلة" : "Favorite",
                  style: TextStyle(
                    height: 2.3,
                    fontSize: 10,
                    color: (Theme.of(context).brightness == Brightness.light)
                        ? Colors.black
                        : Colors.white,
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
