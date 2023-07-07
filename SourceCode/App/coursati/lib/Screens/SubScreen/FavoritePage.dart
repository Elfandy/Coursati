import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

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
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          bottomOpacity: 0,
          title: Text(
            (languageType == 0) ? "المفضلة" : "Favorite",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: Container());
  }

  Future favorite() async {
    var url = 'myfav';
    try {
      var response = await dioTestApi.post(url, data: {user.id});
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}
