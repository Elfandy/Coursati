import 'package:flutter/material.dart';
import '../Widgets/CustomeWidgets/SearchBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 400,
                            width: double.infinity,
                            
                          );
                        },
                      );
                    },
                    child: Image(
                        image: AssetImage("Assets/Icons/options.png"),
                        height: 30),
                  ),
                ),
                SearchBar()
              ],
            ),
          )
        ],
      ),
    );
  }
}
