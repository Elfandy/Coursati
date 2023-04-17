import 'package:flutter/material.dart';

import '../FileHandle.dart';

class FileController extends ChangeNotifier {
  String _text = "";

  String get text => _text;

  readConfig() async {
    _text = await FileHandle().readConfig();
    notifyListeners();
  }

  writeConfig(String text) async {
    dynamic _text = await FileHandle().writeConfig(text);
    notifyListeners();
  }
}
