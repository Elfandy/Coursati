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
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedFontSize: 12,

        selectedItemColor: Color(0xff1766e0),

        unselectedFontSize: 12,

        selectedLabelStyle: const TextStyle(
          height: 2,
        ),
        unselectedLabelStyle: const TextStyle(
          height: 2,
        ),

        iconSize: 28,

        unselectedItemColor: Color(0xff999999),

        showUnselectedLabels: true,
        showSelectedLabels: true,

        type: BottomNavigationBarType.fixed,

        ////////////////////////////////////////
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Logo/home.png")),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Logo/search.png")),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Logo/preseintation.png")),
            label: "TrainingCenter",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Logo/more.png")),
            label: "More",
          ),
        ],
        //////////////////////////////////

        currentIndex: currentPage,
        onTap: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
