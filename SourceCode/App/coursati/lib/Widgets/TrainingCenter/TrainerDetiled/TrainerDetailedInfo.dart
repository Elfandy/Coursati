import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/Trainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TrainerDetailedInfo extends StatefulWidget {
  TrainerDetailedInfo({super.key, required this.trainer});
  Trainer trainer;
  @override
  State<TrainerDetailedInfo> createState() => _TrainerDetailedInfoState();
}

class _TrainerDetailedInfoState extends State<TrainerDetailedInfo> {
  TextEditingController _name = TextEditingController(),
      _major = TextEditingController(),
      _discription = TextEditingController();

  TextEditingController _nameEdit = TextEditingController(),
      _majorEdit = TextEditingController(),
      _discriptionEdit = TextEditingController();

  String _imageName = '';
  File? _image = null;
  bool isEditing = false;
  @override
  void initState() {
    _name.text = widget.trainer.name;
    _discription.text = widget.trainer.discription;
    _major.text = widget.trainer.major;

    _nameEdit.text = _name.text;
    _discriptionEdit.text = _discription.text;
    _majorEdit.text = _major.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            centerTitle: true,
            bottomOpacity: 1,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            title: Text(
              (languageType == 0) ? "المدرب " : "Trainer",
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black54, fontSize: 28),
            ),
          ),
          body: SafeArea(
              child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: isDark ? Colors.grey : Colors.black,
                radius: 122,
                child: CircleAvatar(
                  radius: 120,
                  foregroundImage: CachedNetworkImageProvider(
                    _image == null
                        ? widget.trainer.image
                        : isEditing
                            ? _image!.path
                            : widget.trainer.image,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : !isEditing
                                ? Colors.black54
                                : Colors.black),
                    controller: !isEditing ? _major : _majorEdit,
                    readOnly: !isEditing,
                    decoration: InputDecoration(
                      label: Text((languageType == 0) ? "التخصص" : "Major"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
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
              isEditing
                  ? OutlinedButton(
                      onPressed: () async {
                        Map<String, dynamic> form = {};
                        form['id'] = widget.trainer.id;
                        if (_name.text != _nameEdit.text) {
                          form['name'] = _nameEdit.text;
                        }
                        if (_major.text != _majorEdit.text) {
                          form['major'] = _majorEdit.text;
                        }
                        if (_discription.text != _discriptionEdit.text) {
                          form['discription'] = _discriptionEdit.text;
                        }

                        if (_image != null) {
                          form['image'] =
                              await MultipartFile.fromFile(_image!.path);
                          form['iamgeName'] = _image!.path.split('/').last;
                        }

                        editTrainer(form: FormData.fromMap(form));
                      },
                      child: Text(languageType == 0 ? "تعديل" : "Submit"))
                  : Container()
            ],
          ))),
    );
  }

  Future editTrainer({required FormData form}) async {
    var url = "trainer/update";
    try {
      var response = await dioTestApi.post(url, data: form);

      if (response.statusCode == 200) {
        if (response.data == 'success') {
          Fluttertoast.showToast(
              msg: languageType == 0
                  ? "تم تعديل بيانات المدرب بنجاح"
                  : "Success editing the trainer data");
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
