import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TagData.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Widgets/CustomeWidgets/TagChip.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class TrainingCenterParsonalInfo extends StatefulWidget {
  TrainingCenterParsonalInfo({super.key, required this.tc});
  TrainingCenter tc;

  @override
  State<TrainingCenterParsonalInfo> createState() =>
      _TrainingCenterParsonalInfoState();
}

class _TrainingCenterParsonalInfoState
    extends State<TrainingCenterParsonalInfo> {
  TextEditingController _name = TextEditingController(),
      _email = TextEditingController(),
      _phoneNumber = TextEditingController(),
      _whatsApp = TextEditingController(),
      _closeTime = TextEditingController(),
      _openTime = TextEditingController(),
      _location = TextEditingController(),
      _website = TextEditingController(),
      _facebook = TextEditingController(),
      _discription = TextEditingController();

  TextEditingController _nameEdit = TextEditingController(),
      _emailEdit = TextEditingController(),
      _phoneNumberEdit = TextEditingController(),
      _whatsAppEdit = TextEditingController(),
      _closeTimeEdit = TextEditingController(),
      _openTimeEdit = TextEditingController(),
      _locationEdit = TextEditingController(),
      _websiteEdit = TextEditingController(),
      _facebookEdit = TextEditingController(),
      _discriptionEdit = TextEditingController();

  List<Tag> _selectedTags = [];
  bool isEditing = false;

  @override
  void initState() {
    setState(() {
      _name.text = widget.tc.name;
      _email.text = widget.tc.email;
      _phoneNumber.text = widget.tc.phoneNumber;
      _whatsApp.text = widget.tc.whatsAppNum;
      _closeTime.text = "${widget.tc.close.hour}:${widget.tc.close.minute}";
      _openTime.text = "${widget.tc.open.hour}:${widget.tc.open.minute}";
      _location.text = widget.tc.location.city!;
      _website.text = widget.tc.website;
      _facebook.text = widget.tc.facebook;
      _discription.text = widget.tc.description;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tag> _selectedTags = widget.tc.tags;
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text((languageType == 0) ? "معلومات المركز" : "Center Info"),
        ),
        floatingActionButton: (!isEditing)
            ? FloatingActionButton(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (!isEditing) {
                    setState(() {
                      isEditing = !isEditing;
                      _nameEdit.text = _name.text;
                      _emailEdit.text = _email.text;
                      _phoneNumberEdit.text = _phoneNumber.text;
                      _whatsAppEdit.text = _whatsApp.text;
                      _closeTimeEdit.text = _closeTime.text;
                      _openTimeEdit.text = _openTime.text;
                      _locationEdit.text = _location.text;
                      _websiteEdit.text = _website.text;
                      _facebookEdit.text = _facebook.text;
                      _discriptionEdit.text = _discription.text;
                    });
                  }
                },
              )
            : Container(),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(children: [
                  CachedNetworkImage(
                    height: 220,
                    width: double.infinity,
                    imageUrl: widget.tc.image,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: !isEditing ? _name : _nameEdit,
                      readOnly: !isEditing,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: !isEditing ? _email : _emailEdit,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        label: Text(
                            (languageType == 0) ? "البريد الإلكترني" : "email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: !isEditing ? _phoneNumber : _phoneNumberEdit,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        label: Text((languageType == 0)
                            ? "رقم الهاتف"
                            : "phone number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: !isEditing ? _whatsApp : _whatsAppEdit,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        label: Text(
                            (languageType == 0) ? "الواتس أب" : "whatsApp"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextField(
                          onTap: () async => {
                            if (isEditing)
                              await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null)
                                  _closeTimeEdit.text =
                                      "${value!.hour}:${value.minute}";
                              }),
                          },
                          readOnly: true,
                          controller: !isEditing ? _closeTime : _closeTimeEdit,
                          decoration: InputDecoration(
                            label: Text((languageType == 0)
                                ? "وقت اﻹغلاق"
                                : "closeTime"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextField(
                          onTap: () async => {
                            if (isEditing)
                              await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null)
                                  _openTimeEdit.text =
                                      "${value!.hour}:${value.minute}";
                              }),
                          },
                          readOnly: true,
                          controller: !isEditing ? _openTime : _openTimeEdit,
                          decoration: InputDecoration(
                            label: Text(
                                (languageType == 0) ? "وقت الفتح" : "openTime"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      readOnly: !isEditing,
                      controller: !isEditing ? _location : _locationEdit,
                      decoration: InputDecoration(
                        label:
                            Text((languageType == 0) ? "العنوان" : "location"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      readOnly: !isEditing,
                      controller: !isEditing ? _website : _websiteEdit,
                      decoration: InputDecoration(
                        label: Text((languageType == 0)
                            ? "الموقع الإلكتروني"
                            : "website"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      readOnly: !isEditing,
                      controller: !isEditing ? _facebook : _facebookEdit,
                      decoration: InputDecoration(
                        label: Text(
                            (languageType == 0) ? "الفيس بوك" : "facebook"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      readOnly: !isEditing,
                      controller: !isEditing ? _discription : _discriptionEdit,
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
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: MultiSelectDialogField(
                          items: tags
                              .map((e) => MultiSelectItem(
                                  e,
                                  (languageType == 0)
                                      ? e.name_ar!
                                      : e.name_en!))
                              .toList(),
                          listType: MultiSelectListType.CHIP,
                          unselectedColor: Colors.grey[600],
                          selectedColor: Color(0xff1776e0),
                          itemsTextStyle: TextStyle(color: Colors.white),
                          checkColor: Colors.white,
                          separateSelectedItems: true,
                          selectedItemsTextStyle:
                              TextStyle(color: Colors.white),
                          onConfirm: (values) {
                            setState(() {
                              _selectedTags = values;
                            });
                          },
                          cancelText:
                              Text((languageType == 0) ? "إلغاء" : "Cancel"),
                          confirmText:
                              Text((languageType == 0) ? "موافق" : "OK"),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: isDark
                                      ? Color(0xff424242)
                                      : Color(0xffdddddd))),
                          dialogHeight: MediaQuery.of(context).size.height / 2,
                          dialogWidth: MediaQuery.of(context).size.width / 2,
                          title: Text(
                            (languageType == 0) ? "أضف وسوم" : "Add Tags",
                            style: TextStyle(
                                color: isDark ? Colors.white : Colors.black),
                          ),
                          buttonText: Text(
                            (languageType == 0) ? "أضف وسوم" : "Add Tags",
                          ),
                        ),
                      )
                    : Container(),
                !isEditing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            for (var item in widget.tc.tags)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TagChip(
                                  passiveBackgroundColor: (isDark)
                                      ? const Color.fromRGBO(250, 250, 250, 0.5)
                                      : const Color.fromRGBO(
                                          200, 200, 200, 0.5),
                                  selected: widget.tc.tags,
                                  tag: item,
                                  selectable: false,
                                ),
                              )
                          ],
                        ))
                    : Container(),
                isEditing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120, 40)),
                            child: Text((languageType == 0) ? "تعديل" : "Edit"),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isEditing = !isEditing;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120, 40)),
                            child:
                                Text((languageType == 0) ? "إلغاء" : "Cancel"),
                          )
                        ],
                      )
                    : Container(),
                !isEditing
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      (languageType == 0)
                                          ? "هل انت متأكد"
                                          : "Are you Sure?",
                                      style: TextStyle(
                                          color: (isDark)
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    content: Text(
                                      (languageType == 0)
                                          ? "حذف مركز التدريب"
                                          : "Delete Training Center",
                                      style: TextStyle(
                                          color: (isDark)
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        //<-- SEE HERE
                                        child: new Text(
                                            (languageType == 0) ? "لا" : "No"),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        // <-- SEE HERE
                                        child: new Text((languageType == 0)
                                            ? "نعم"
                                            : "Yes"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              //
                            },
                            child: Text(
                              languageType == 0
                                  ? "حذف مركز التدريب"
                                  : "Delete Training Center",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )),
                      )
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }

  Future DeleteTC(int id) async {}
}
