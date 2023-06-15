import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cr_file_saver/file_saver.dart';
import 'package:cr_file_saver/generated/assets.dart';
import '../../Classes/GlobalVariables.dart';

class FileHandle {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/Config.conf');
  }

  Future<File> writeConfig(String conf) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(conf);
  }

  Future<String?> readConfig() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  void extractConfigData(String temp) {
    isDark = temp
            .substring(temp.indexOf(':', temp.indexOf("darkMode")) + 1,
                temp.indexOf(',', temp.indexOf("darkMode")))
            .toLowerCase() ==
        'true';
    languageType = int.parse(temp.substring(
        temp.indexOf(':', temp.indexOf("language")) + 1,
        temp.indexOf(",", temp.indexOf("language"))));

    // user.name = temp.substring(temp.indexOf(':', temp.indexOf('name')) + 1,
    //     temp.indexOf(',', temp.indexOf('name')));
    // user.birthDate = temp.substring(
    //     temp.indexOf(':', temp.indexOf('birthDate')) + 1,
    //     temp.indexOf(',', temp.indexOf('birthDate')));
    // user.email = temp.substring(temp.indexOf(':', temp.indexOf('email')) + 1,
    //     temp.indexOf(',', temp.indexOf('email')));
    // user.gender = temp.substring(temp.indexOf(':', temp.indexOf('gender')) + 1,
    //     temp.indexOf(',', temp.indexOf('gender')));
    // user.id = int.parse(temp.substring(
    //     temp.indexOf(':', temp.indexOf('id')) + 1,
    //     temp.indexOf(',', temp.indexOf('id'))));
    // user.image = temp.substring(temp.indexOf(':', temp.indexOf('image')) + 1,
    //     temp.indexOf(',', temp.indexOf('image')));
    // user.notifications = int.parse(temp.substring(
    //     temp.indexOf(':', temp.indexOf('notifications')) + 1,
    //     temp.indexOf(',', temp.indexOf('notifications'))));
    // user.password = temp.substring(
    //     temp.indexOf(':', temp.indexOf('password')) + 1,
    //     temp.indexOf(',', temp.indexOf('password')));
    // user.token = temp.substring(temp.indexOf(':', temp.indexOf('token')) + 1,
    //     temp.indexOf(',', temp.indexOf('token')));
    // user.trainingCenterId = int.parse(temp.substring(
    //     temp.indexOf(':', temp.indexOf('trainingCenterId')) + 1,
    //     temp.indexOf(',', temp.indexOf('trainingCenterId'))));
  }
}
