import 'package:coursati/Widgets/NetworkPopUp.dart';
import 'package:flutter/material.dart';
import '../Classes/GlobalVariables.dart';
import 'Home_Page.dart';
import 'More_Page.dart';
import 'TrainingCenter_Page.dart';
import 'search_Page.dart';
import 'package:internet_popup/internet_popup.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    TrainingCenter(),
    MorePage(),
  ];

// * This is the initiliser of the app
  @override
  void initState() {
    InternetPopup()
        .initializeCustomWidget(context: context, widget: const NetworkPopup());

    super.initState();
  }

  //* This is the Builder for the app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedFontSize: 10,

        unselectedFontSize: 10,

        selectedLabelStyle: const TextStyle(
          height: 2.5,
        ),
        unselectedLabelStyle: const TextStyle(
          height: 2,
        ),

        iconSize: (MediaQuery.of(context).size.height / 25),

        showUnselectedLabels: true,
        showSelectedLabels: true,

        type: BottomNavigationBarType.fixed,

        ////////////////////////////////////////
        ///
        ///
        items: [
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("Assets/Logo/home.png")),
            label: (languageType == 0) ? "الرئيسية" : "Home",
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("Assets/Logo/search.png")),
            label: (languageType == 0) ? "البحث" : "Search",
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("Assets/Logo/preseintation.png")),
            label: (languageType == 0) ? "مركز التدريب" : "Training Center",
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("Assets/Logo/more.png")),
            label: (languageType == 0) ? "المزيد" : "More",
          ),
        ],
        //////////////////////////////////

        currentIndex: _currentPage,
        onTap: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
    );
  }
}
