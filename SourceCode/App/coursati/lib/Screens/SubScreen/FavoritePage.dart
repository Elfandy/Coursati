import 'package:flutter/material.dart';

import '../../main.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          splashColor: Color(0xff1776e0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff1776e0),
          ),
        ),
        shadowColor: Color(0xff1776e0),
        title: Text(
          (languageType == 0) ? "المفضلة" : "Favorite",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(),
    );
  }
}
