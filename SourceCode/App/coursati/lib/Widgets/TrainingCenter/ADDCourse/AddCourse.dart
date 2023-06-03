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

import '../../../Classes/Trainer.dart';

class AddCourse extends StatefulWidget {
  AddCourse({super.key, required this.trainingCenter, required this.trainers});
  TrainingCenter trainingCenter;
  List<TrainerData> trainers;
  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  TextEditingController _name = TextEditingController(),
      _id = TextEditingController(),
      _price = TextEditingController(),
      _descitpion = TextEditingController(),
      _startingDate = TextEditingController(),
      _duration = TextEditingController();

  List<int> _selectTagsNum = [];
  List<Tag> _selectedTags = [];
  TrainerData? trainer;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text((languageType == 0) ? "إضافة دورة" : "Add Course"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 270,
              child: Image.asset(
                "Assets/Images/techny-artificial-intelligence-on-tablet-screen.gif",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _id,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: (languageType == 0) ? " رمز الدورة" : "ID",
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
                  labelText: (languageType == 0) ? "اسم الدورة" : "Course Name",
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
                controller: _price,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 5,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  counterText: "",
                  labelText: (languageType == 0) ? "السعر" : "price",
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
                controller: _duration,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  counterText: "",
                  labelText: (languageType == 0)
                      ? "المدة الزمنية (بالساعات)"
                      : "Duration (Hours)",
                  // labelStyle: TextStyle(color:)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownSearch(
                items: [for (var x in widget.trainers) x.name],
                popupProps: const PopupProps.bottomSheet(
                  bottomSheetProps: BottomSheetProps(
                      backgroundColor: Color(0xff1776e0),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)))),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      labelText: (languageType == 0) ? "المدرب" : "Trainer",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                onChanged: (val) {
                  setState(() {
                    widget.trainers.forEach((element) {
                      if (element.name == val) {
                        trainer = element;
                        return;
                      }
                    });
                  });
                },
                selectedItem: trainer != null ? trainer!.name : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _startingDate,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 730)),
                      useRootNavigator: true);

                  if (pickedDate != null) {
                    String foramteDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      _startingDate.text = foramteDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText:
                      (languageType == 0) ? "تاريخ البداية" : "startingDate",
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
                  labelText: (languageType == 0) ? "الوصف" : "Discription",
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
              padding: const EdgeInsets.all(8.0),
              child: MultiSelectDialogField(
                items: tags
                    .map((e) => MultiSelectItem(
                        e, (languageType == 0) ? e.name_ar! : e.name_en!))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedTags = values;
                },
                buttonIcon: const Icon(Icons.arrow_drop_down),
                cancelText: Text((languageType == 0) ? "إلغاء" : "Cancel"),
                confirmText: Text((languageType == 0) ? "موافق" : "OK"),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xff424242)
                        : const Color(0xffdddddd),
                  ),
                ),
                dialogWidth: MediaQuery.of(context).size.width / 1.4,
                title: Text(
                  (languageType == 0) ? "أضف وسوم" : "Add Tags",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                buttonText: Text(
                  (languageType == 0) ? "أضف وسوم" : "Add Tags",
                ),
              ),
            ),
            Wrap(
              runAlignment: WrapAlignment.start,
              children: [
                for (var item in _selectTagsNum)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TagChip(
                      passiveBackgroundColor: (isDark)
                          ? const Color.fromRGBO(250, 250, 250, 0.5)
                          : const Color.fromRGBO(200, 200, 200, 0.5),
                      selected: [],
                      tag: tags[item],
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    (languageType == 0)
                        ? "فم بتحميل صورة للدورة التدريبية"
                        : "Upload a picture for your course",
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
