import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHandle {
  Future<String> get _localPath async {
   final dynamic directory = await getApplicationDocumentsDirectory();


    return directory.path;
  }

  Future<File> get _file async {
    final path = await _localPath;
    return File('$path/config.conf');
  }

  // Future<File> writeConfig(String text) async {
  //   final file = await _localConfig;

  //   // Write the file
  //   return file.writeAsString(text);
  // }

  readConfig() async {
    String fileContent = "";
    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }
    return fileContent;
  }

  writeConfig(String text) async {
    File file = await _file;

    await file.writeAsString(text);
  }
}
