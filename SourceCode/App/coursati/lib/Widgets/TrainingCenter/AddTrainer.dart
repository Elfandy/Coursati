import 'dart:io';

import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Widgets/CustomeWidgets/TagChip.dart';
import 'package:coursati/Widgets/TrainingCenter/ADDCourse/ContainerForCourse.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddTrainer extends StatefulWidget {
  AddTrainer({super.key, required this.trainingCenter});
  TrainingCenter trainingCenter;

  @override
  State<AddTrainer> createState() => _AddTrainerState();
}

class _AddTrainerState extends State<AddTrainer> {
  TextEditingController _name = TextEditingController(),
      _major = TextEditingController(),
      _descitpion = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text((languageType == 0) ? "إضافة مدرب" : "Add Trainer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 270,
              child: Image.asset(
                "Assets/Images/juicy-ai-person-detection-slash-face-id.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                languageType == 0
                    ? "ادخل بيانات المدرب ﻷضافته للمركز التدريبي"
                    : "Enter The Trainer Details to add him to training center.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _name,
                maxLines: 1,
                maxLength: 45,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  counterText: "",
                  labelText:
                      (languageType == 0) ? "اسم المدرب" : "Trainer Name",
                  // labelStyle: TextStyle(color:)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _major,
                maxLines: 1,
                maxLength: 45,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  counterText: "",

                  labelText: (languageType == 0) ? "التخصص" : "Major",
                  // labelStyle: TextStyle(color:)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _descitpion,
                minLines: 1,
                maxLines: 50,
                maxLength: 2500,
                inputFormatters: [],
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: (languageType == 0)
                      ? "وصف عن المدرب"
                      : "Discription on the Trainer",
                  // labelStyle: TextStyle(color:)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                spellCheckConfiguration: SpellCheckConfiguration(
                    spellCheckService: DefaultSpellCheckService()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    (languageType == 0) ? "صورة للمدرب" : "Trainer Picture",
                    style: TextStyle(fontSize: ((languageType == 0) ? 20 : 16)),
                  ),
                  const Text("*", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            _image != null
                ? CircleAvatar(
                    radius: 100,
                    foregroundImage: FileImage(
                      _image!,
                    ),
                  )
                : Image(
                    width: MediaQuery.of(context).size.width,
                    image: const AssetImage(
                        "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                    height: 150,
                  ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  (MediaQuery.of(context).size.width / 4),
                  10,
                  (MediaQuery.of(context).size.width / 4),
                  10),
              child: OutlinedButton(
                  onPressed: getImage,
                  style: OutlinedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    fixedSize: Size(100, 30),
                  ),
                  child:
                      Text((languageType == 0) ? "اختر الصورة" : "Pic Imgae")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ElevatedButton(
                  onPressed: () {
                    if (_name.text.isEmpty) {
                      return;
                    }
                    if (_major.text.isEmpty) {}
                    if (_descitpion.text.isEmpty) {}
                    if (_image == null) {}

                    if (_name.text.isNotEmpty &&
                        _descitpion.text.isNotEmpty &&
                        _major.text.isNotEmpty &&
                        _image != null) {}
                  },
                  style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      fixedSize:
                          Size((MediaQuery.of(context).size.width / 1.5), 50)),
                  child: Text(
                    (languageType == 0) ? "إضافة" : "Create",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
  }

  Future setTrainer(
      {required String name,
      required String major,
      required String description,
      required File image}) async {
    var url = "";
    try {
      var response = await dioTestApi.post(url, data: {
        'name': name,
        'major': major,
        'description': description,
        'image': image
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: languageType == 0
                ? "تمت الإضافة بنجاح."
                : "Added succesfully.");
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
