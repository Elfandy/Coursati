import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../Classes/Course.dart';
import '../../../Classes/GlobalVariables.dart';
import '../../../Classes/TagData.dart';
import '../../../Classes/Trainer.dart';
import '../../CustomeWidgets/TagChip.dart';

class CourseDetailedInfo extends StatefulWidget {
  const CourseDetailedInfo(
      {super.key, required this.course, required this.trainers});
  final Course course;
  final List<BLDTrainer> trainers;

  @override
  State<CourseDetailedInfo> createState() => _CourseDetailedInfoState();
}

class _CourseDetailedInfoState extends State<CourseDetailedInfo> {
  final TextStyle _labeleStyle = TextStyle(
      color: const Color(0xff1776e0), fontSize: (languageType == 0) ? 22 : 20);

  TextEditingController _name = TextEditingController(),
      _price = TextEditingController(),
      _duration = TextEditingController(),
      _discription = TextEditingController(),
      _trainer = TextEditingController(),
      _startDate = TextEditingController();
  int _trainerId = 0;
  BLDTrainer trainer = BLDTrainer(id: "", name: "");

  TextEditingController _nameEdit = TextEditingController(),
      _priceEdit = TextEditingController(),
      _durationEdit = TextEditingController(),
      _discriptionEdit = TextEditingController(),
      _trainerEdit = TextEditingController(),
      _startDateEdit = TextEditingController();

  List<int> _selectTagsNum = [];
  List<Tag> _selectedTags = [];

  bool isEditing = false;
  @override
  @override
  void initState() {
    for (var item in widget.trainers) {
      if (item.name == _trainer.text) {
        trainer = item;
      }
    }
    _nameEdit = _name;
    _discriptionEdit = _discription;
    _durationEdit = _duration;
    _priceEdit = _price;
    _startDateEdit = _startDate;
    _trainerEdit = _trainer;
    super.initState();
  }

  Widget build(BuildContext context) {
    _selectedTags.clear();
    for (int i = 0; i < widget.course.tags.length; i++) {
      _selectedTags.add(widget.course.tags[i]);
    }
    _trainerId = int.parse(widget.course.trainer);
    _trainer.text = widget.course.trainerData.name;
    _name.text = widget.course.name;
    _discription.text = widget.course.description;
    _duration.text = widget.course.duration.toString();
    _startDate.text = DateFormat.yMd().format(widget.course.startingDate);
    _price.text = widget.course.price.toString();
    return WillPopScope(
      onWillPop: () async {
        if (isEditing) {
          setState(() {
            isEditing = !isEditing;
          });
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Scaffold(
          floatingActionButton: !isEditing
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: const Icon(Icons.edit))
              : Container(),
          appBar: AppBar(
            elevation: 0,
            bottomOpacity: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              (languageType == 0) ? "الدورة التدريبية" : "Course",
              style: TextStyle(color: isDark ? Colors.white : Colors.black54),
            ),
          ),
          body: SafeArea(
              child: ListView(
            children: [
              Stack(children: [
                CachedNetworkImage(
                  height: 220,
                  width: double.infinity,
                  imageUrl: widget.course.image,
                  fit: BoxFit.cover,
                ),
                (isEditing)
                    ? Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 160),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Icon(Icons.edit),
                            style: OutlinedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Color(0x44444444)),
                          ),
                        ),
                      )
                    : Container(),
              ]),
              // Container(
              //   height: 200,
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(50)),
              //   child: CachedNetworkImage(
              //     imageUrl: widget.course.image,
              //     errorWidget: (context, url, error) => const Icon(Icons.error),
              //     progressIndicatorBuilder: (context, url, progress) => Center(
              //         child:
              //             CircularProgressIndicator(value: progress.progress)),
              //     fit: BoxFit.cover,
              //     // height: 300,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: !isEditing ? _name : _nameEdit,
                    readOnly: !isEditing,
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "الاسم" : "name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _startDate : _startDateEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text(
                          (languageType == 0) ? "تاريخ البداية" : "Start date"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _duration : _durationEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "المدة" : "duration"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _price : _priceEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "السعر" : "price"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _discription : _discriptionEdit,
                    readOnly: !isEditing,
                    minLines: 1,
                    maxLines: 500,
                    decoration: InputDecoration(
                      label:
                          Text((languageType == 0) ? "الوصف" : "discription"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Wrap(
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
              // MultiSelectDialogField(
              //   items: tags
              //       .map((e) => MultiSelectItem(
              //           e, (languageType == 0) ? e.name_ar! : e.name_en!))
              //       .toList(),
              //   listType: MultiSelectListType.CHIP,
              //   onConfirm: (values) {
              //     _selectedTags = values;
              //   },
              //   cancelText:
              //       Text((languageType == 0) ? "إلغاء" : "Cancel"),
              //   confirmText: Text((languageType == 0) ? "موافق" : "OK"),
              //   selectedItemsTextStyle: TextStyle(color: Colors.white),
              //   itemsTextStyle: TextStyle(color: Colors.white),
              //   selectedColor: Color(0xff1776e0),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       border: Border.all(
              //           color: isDark
              //               ? Color(0xff424242)
              //               : Color(0xffdddddd))),
              //   dialogHeight: MediaQuery.of(context).size.height / 2,
              //   dialogWidth: MediaQuery.of(context).size.width / 2,
              //   title: Text(
              //     (languageType == 0) ? "أضف وسوم" : "Add Tags",
              //     style: TextStyle(
              //         color: isDark ? Colors.white : Colors.black),
              //   ),
              //   buttonText: Text(
              //     (languageType == 0) ? "أضف وسوم" : "Add Tags",
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (Tag i in _selectedTags)
                      TagChip(
                        passiveBackgroundColor: (isDark)
                            ? const Color.fromRGBO(250, 250, 250, 0.5)
                            : const Color.fromRGBO(200, 200, 200, 0.5),
                        selected: _selectedTags,
                        tag: i,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _trainer : _trainerEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? " المدرب" : "Trainer"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              (isEditing)
                  ? DropdownButton(
                      items: [
                          for (var item in widget.trainers)
                            DropdownMenuItem(
                              child: Text(item.name),
                              value: item,
                            )
                        ],
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            trainer = value;
                            _trainerEdit.text = trainer.name;
                          }
                        });
                      })
                  : Container(),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              //? This is the side where simple data is in

              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              //? This is the side of the tags section

              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              //? This is the side of the about the course section
            ],
          ))),
    );
  }

  Future<Course> getCourseData(String id) async {
    var url = "showCourseData";
    Map<String, dynamic> course = {"id": id};
    Course _course = Course(
      name: "",
      trainingCenterID: "0",
      image: "",
      id: '',
      active: 0,
      description: """""",
      discount: 0,
      duration: 0,
      full: false,
      price: 0,
      startingDate: DateTime(2023),
      tags: [],
      trainer: "0",
      icon: "",
      location: locations[0],
      repeats: false,
      trainerData: Trainer(
        id: "0",
        discription: """""",
        image: "",
        major: "",
        name: "",
      ),
    );

    try {
      var response = await dioTestApi.post(url, data: course);
      if (response.statusCode == 200) {
        _course = Course.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return _course;
  }

  Future editCourse({required FormData form}) async {
    var url = "";

    try {
      var response = await dioTestApi.post(url, data: form);
      if (response.statusCode == 200) {
        if (response.data == 'success') {
          Fluttertoast.showToast(
              msg: languageType == 0
                  ? "تم تعديل بيانات الدورة بنجاح"
                  : "Course data has been editited successfully");
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }

  Future disable({required FormData form}) async {
    var url = "";
    try {
      var response = await dioTestApi.post(url, data: form);
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}
