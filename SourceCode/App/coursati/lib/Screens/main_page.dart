import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Widgets/NetworkPopUp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Classes/GlobalVariables.dart';
import 'Home_Page.dart';
import 'More_Page.dart';
import 'TrainingCenterPage.dart';
import 'search_Page.dart';
import 'package:internet_popup/internet_popup.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 3;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    TrainingCenter(),
    MorePage(),
  ];

// * This is the initiliser of the app
  @override
  void initState() {
    //!This is for the network popup
    // InternetPopup()
    //     .initializeCustomWidget(context: context, widget: const NetworkPopup());

    super.initState();
    FlutterNativeSplash.remove();
    fillTags();
  }

  //* This is the Builder for the app

  @override
  Widget build(BuildContext context) {
    //*** This is the temp TrainingCenter local data insert */

    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
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
              icon:
                  const ImageIcon(AssetImage("Assets/Logo/preseintation.png")),
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
      ),
    );
  }

//* This is the function for the alert dialog of exit the app
  Future<bool> _onPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          (languageType == 0) ? "هل انت متأكد" : "Are you Sure?",
          style: TextStyle(color: (isDark) ? Colors.white : Colors.black),
        ),
        content: Text(
          (languageType == 0) ? "الخروج من التطبيق" : "Exit The App",
          style: TextStyle(color: (isDark) ? Colors.white : Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            //<-- SEE HERE
            child: new Text((languageType == 0) ? "لا" : "No"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            // <-- SEE HERE
            child: new Text((languageType == 0) ? "نعم" : "Yes"),
          ),
        ],
      ),
    ));
  }
}

Future fillTags() async {
  var url = "tags";
  tags.clear();
  try {
    var response = await dioTestApi.get(url);
    if (response.statusCode == 200) {
      List<dynamic> taglist = response.data;
      print(response.data);
      for (var tag in taglist) {
        tags.add(Tag.fromJson(tag));
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
