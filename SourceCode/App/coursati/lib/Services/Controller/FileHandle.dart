import 'package:shared_preferences/shared_preferences.dart';
import '../../Classes/GlobalVariables.dart';

class FileHandle {
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/Config.conf');
  // }

  Future writeConfig(Map conf) async {
    //!!! depracted file handel
    // final file = await _localFile;

    // // Write the file
    // return file.writeAsString(conf.toString());
    //!!!!!!!!!!!!!!!!!1
    //?????????? New File Handle
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('darkMode', conf['darkMode']);
    prefs.setString('token', conf['token']);
    prefs.setInt('language', conf['language']);
    prefs.setString('name', conf['name']);
    prefs.setString('email', conf['email']);
    prefs.setInt('gender', conf['gender']);
    prefs.setInt('notifications', conf['notifications']);
    prefs.setString('birthDate', conf['birthDate']);

    prefs.setString('image', conf['image']);
    prefs.setInt('hasTC', conf['hasTC']);

    prefs.setString('passportID', conf['passportID']);
    prefs.setString('phoneNumber', conf['phoneNumber']);

    prefs.setInt('id', conf['id']);
    return true;
  }

  Future<String?> readConfig() async {
    try {
      //!!! depracted files handle
      // final file = await _localFile;

      // // Read the file
      // final contents = await file.readAsString();

      //!!!
      //?????????? New File Handle
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final contents = prefs.getString('token');
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  void extractConfigData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool('darkMode') ?? false;

    languageType = prefs.getInt('language') ?? 0;

    user.name = prefs.getString('name')!;

    user.birthDate = prefs.getString('birthDate')!;

    user.email = prefs.getString('email')!;

    user.gender = prefs.getInt('gender')!;

    user.id = prefs.getInt('id')!;

    user.image = prefs.getString('image')!;

    user.notifications = prefs.getInt('notifications')!;

    user.token = prefs.getString('token')!;

    deviceID = prefs.getString('deviceid')!;
    user.hasTC = prefs.getInt('hasTC')!;
    user.personalID = prefs.getString('passportID')!;
    user.phoneNumber = prefs.getString('phoneNumber')!;
  }
}
