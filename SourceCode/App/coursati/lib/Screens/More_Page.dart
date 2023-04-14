import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coursati/Classes/UserData.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  UserData user = UserData(
      name: "XDslipcy",
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
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.amber,
                          onTap: () => {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                  "Assets/Icons/Bill.png",
                                ),
                                height: 30,
                              ),
                              Text(
                                "الرسائل",
                                style: TextStyle(height: 2),
                              ),
                            ],
                          ),
                        ),
                        // const VerticalDivider(),
                        InkWell(
                          onTap: () => {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage("Assets/Icons/Fav.png"),
                                height: 30,
                              ),
                              Text(
                                "المفضلة",
                                style: TextStyle(
                                  height: 2.3,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              InkWell(
                onTap: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("Assets/Icons/user.png"),
                        height: 30,
                      ),
                    ),
                    Text(
                      "إدارة الحساب",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 40,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("Assets/Icons/settings.png"),
                        height: 30,
                      ),
                    ),
                    Text(
                      "الإعدادات",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 40,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("Assets/Icons/about.png"),
                        height: 30,
                      ),
                    ),
                    Text(
                      "حول",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 40,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Image(
          image: AssetImage("Assets/Images/Startup/Logo.png"),
          height: 150,
        )
      ],
    );
  }
}
