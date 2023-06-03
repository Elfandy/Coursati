import 'dart:io';

import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Widgets/CustomeWidgets/TagChip.dart';
import 'package:coursati/Widgets/TrainingCenter/ADDCourse/ContainerForCourse.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      major = TextEditingController(),
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
            // Container(
            //   width: MediaQuery.of(context).size.width / 1.5,
            //   height: 270,
            //   child: Image.asset(
            //     "Assets/Images/techny-artificial-intelligence-on-tablet-screen.gif",
            //     fit: BoxFit.contain,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _name,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
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
                controller: _name,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
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
                ? Image.file(
                    _image!,
                    width: 10,
                    height: 200,
                    fit: BoxFit.cover,
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
            ElevatedButton(
                onPressed: () {},
                child: Text((languageType == 0) ? "إضافة" : "Create"))
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
}
