import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'More_Page.dart';
import 'TrainingCenter_Page.dart';
import 'search_Page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    TrainingCenter(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: ImageIcon(AssetImage("Assets/Logo/home.png")),
              label: "hello",
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage("Assets/Logo/search.png")),
              label: "hello",
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage("Assets/Logo/presentaition.png")),
              label: "hello",
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage("Assets/Logo/more.png")),
              label: "hello",
            ),
          ],
        ));
  }
}
