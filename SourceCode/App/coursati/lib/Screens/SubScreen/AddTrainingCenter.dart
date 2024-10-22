import 'dart:io';
import 'package:coursati/Widgets/CustomeWidgets/TagChip.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geocoder2/geocoder2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Classes/Location.dart';
import '../../Classes/TagData.dart';
import '../../Classes/TrainingCenter.dart';
import '../../Services/ScreenController.dart';
import '../../Widgets/TrainingCenter/SetLoationMap.dart';

class AddTrainingCenterPage extends StatefulWidget {
  const AddTrainingCenterPage({super.key});

  @override
  State<AddTrainingCenterPage> createState() => _AddTrainingCenterPageState();
}

class _AddTrainingCenterPageState extends State<AddTrainingCenterPage> {
  int _index = 0;
  bool codeCheck = false, _emailCheck = false;
  final TextEditingController _id = TextEditingController(),
      // _companyName = TextEditingController(),
      _code = TextEditingController(),
      _trainingCenterName = TextEditingController(),
      _email = TextEditingController(),
      _trainingCenterPhoneNumber = TextEditingController(),
      _location = TextEditingController(),
      _website = TextEditingController(),
      _facebook = TextEditingController(),
      _description = TextEditingController(),
      _whatsapp = TextEditingController(),
      _closeTime = TextEditingController(),
      _openTime = TextEditingController();
  double _openDouble = 0, _closeDouble = 0;
  String? _dropDownValue;
  Locations locationData = Locations(city: "", id: 0, lat: 0, lng: 0);
  // Location? _dropDownValue = locations.first;

  bool _showPersonalPhonenymberErrorMessage = false,
      _showTrainingCenterPhoneNumberErrorMessage = false;
  List<int> _SearchBoxTags = [], _selectTagsNum = [];
  List<Tag> _selectedTags = [];

  //!!!!!!!!!!!

  File? _image, _logo;

  bool passsportError = false, orgNameError = false, phoneNumError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.95),
              width: double.infinity,
              child: Stepper(
                controlsBuilder: (context, details) {
                  return SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        if (_index == 0)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: (_id.text != '' &&
                                        // _companyName.text != '' &&

                                        _trainingCenterName.text != '' &&
                                        _email.text.contains("@") &&
                                        _email.text.indexOf("@") ==
                                            _email.text.lastIndexOf("@") &&
                                        _dropDownValue != '' &&
                                        _trainingCenterPhoneNumber.text != '' &&
                                        _description.text.length > 100 &&
                                        _image != null &&
                                        (_trainingCenterPhoneNumber.text
                                                .startsWith("091") ||
                                            _trainingCenterPhoneNumber.text
                                                .startsWith("092") ||
                                            _trainingCenterPhoneNumber.text
                                                .startsWith("094") ||
                                            _trainingCenterPhoneNumber.text
                                                .startsWith("095") ||
                                            _trainingCenterPhoneNumber.text
                                                .startsWith("093")))
                                    ? details.onStepContinue
                                    : null,
                                child: Text(
                                  (languageType == 0) ? "التالي" : "Next",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        else if (_index == 1)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: details.onStepContinue,
                                child: Text(
                                  (languageType == 0) ? "إرسال" : "Submit",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        if (_index != 0)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text(
                                  (languageType == 0) ? "الرجوع" : "Back",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: details.onStepCancel,
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                },
                steps: [
                  Step(
                    isActive: _index == 0,
                    title: Text(
                        (languageType == 0) ? "تعبئة البيانات" : "Fill Data"),
                    content: Column(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: const AssetImage(
                            "Assets/Images/handy-line-web-design-browser 1.png"),
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          (languageType == 0)
                              ? "قم بتعبئة البيانات لكي تستطيع طلب إنشاء مركزك التدريبي في المنصة"
                              : "Fill out data to create your own training center in the platform.",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_id.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset: _id.text.length - 1))) {
                              _id.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _id.text.length));
                            }
                          },
                          controller: _id,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(english),
                          ],
                          maxLength: 8,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              const Icon(
                                Icons.perm_identity,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "رقم جواز السفر"
                                    : "Passport ID",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text("*",
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),

                      // Visibility(
                      //   visible: _showPersonalPhonenymberErrorMessage,
                      //   child: Text(
                      //     languageType == 0
                      //         ? "رقم الهاتف يجب ان يبدأ ب 091 أو 092 أو 094 أو 095"
                      //         : "Phone number needs to starts with 091,092,094,095",
                      //     style: const TextStyle(color: Colors.red),
                      //   ),
                      // ),
                      //* This is for creating an OTP function for the phoen number
                      // Text((languageType == 0)
                      //     ? ""
                      //     : "Send a code to verify your Phone number"),
                      // OutlinedButton(
                      //     child: Text((languageType == 0) ? "" : "Send Code"),
                      //     onPressed: () async {
                      //       setState(() {
                      //         _secretCode = 123456;
                      //       });
                      //       await termii.sendSms(
                      //         destination: "218${_phoneNumber.text}",
                      //         message:
                      //             "This is a test message ${_secretCode}",
                      //       );
                      //       Fluttertoast.showToast(
                      //           msg: "Code Sent to ${_phoneNumber.text}",
                      //           backgroundColor: const Color(0xff999999),
                      //           gravity: ToastGravity.BOTTOM);
                      //     }),
                      // TextField(
                      //   controller: _code,
                      //   selectionControls: EmptyTextSelectionControls(),
                      //   maxLengthEnforcement:
                      //       MaxLengthEnforcement.truncateAfterCompositionEnds,
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter.digitsOnly,
                      //   ],
                      //   onTapOutside: (event) {
                      //     setState(() {
                      //       if (_code.text == _secretCode.toString()) {
                      //         codeCheck = true;
                      //       }
                      //     });
                      //   },
                      //   maxLength: 6,
                      //   style: const TextStyle(
                      //       color: Colors.black, fontSize: 16),
                      //   decoration: InputDecoration(
                      //     counterText: "",
                      //     label: Text(
                      //       (languageType == 0) ? "الرقم السري" : "Code",
                      //       style: const TextStyle(fontSize: 16),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: const BorderSide(),
                      //       borderRadius: BorderRadius.circular(50),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_trainingCenterName.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset:
                                        _trainingCenterName.text.length - 1))) {
                              _trainingCenterName.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _trainingCenterName.text.length));
                            }
                          },
                          controller: _trainingCenterName,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 20,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              const Icon(
                                Icons.business,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "اسم مركز التدريب"
                                    : "Training Center Name",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text("*",
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: _emailCheck,
                        child: Text(
                          languageType == 0
                              ? "هذا ليس ايميل صحيح."
                              : "This is not a valid email address",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      Focus(
                        onFocusChange: (value) {
                          if (!value) {
                            setState(
                              () {
                                if (_email.text.contains("@") &&
                                        _email.text.contains(".") &&
                                        _email.text.indexOf("@") <
                                            _email.text.indexOf(".") &&
                                        _email.text.lastIndexOf("@") ==
                                            _email.text.indexOf("@")
                                    //     &&
                                    // _email.text.lastIndexOf(".") ==
                                    //     _email.text.indexOf(".")
                                    ) {
                                  _emailCheck = false;
                                } else {
                                  _emailCheck = true;
                                }
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            // onSubmitted: (value) {
                            //   setState(
                            //     () {
                            //       if (_email.text.contains("@") &&
                            //           _email.text.contains(".") &&
                            //           _email.text.indexOf("@") <
                            //               _email.text.indexOf(".") &&
                            //           _email.text.lastIndexOf("@") ==
                            //               _email.text.indexOf("@")) {
                            //         _emailCheck = false;
                            //       } else {
                            //         _emailCheck = true;
                            //       }
                            //     },
                            //   );
                            // },
                            onTap: () {
                              if (_email.selection ==
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _email.text.length - 1))) {
                                _email.selection = TextSelection.fromPosition(
                                    TextPosition(offset: _email.text.length));
                              }
                            },
                            controller: _email,
                            selectionControls: EmptyTextSelectionControls(),
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            maxLength: 32,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              counterText: "",
                              label: Row(children: [
                                const Icon(
                                  Icons.mail,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (languageType == 0)
                                      ? "البريد الالكتروني للمركز"
                                      : "Training Center Email",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text("*",
                                    style: TextStyle(color: Colors.red)),
                              ]),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              const Icon(
                                Icons.location_on,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0) ? "العنوان" : "Address",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Text("*",
                                  style: TextStyle(color: Colors.red)),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          controller: _location,
                          readOnly: true,
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .push(ScreenController()
                                      .createRoute(SetLocationMap(), 0))
                                  .then(
                                (value) {
                                  if (value.latitude != 0 &&
                                      value.longitude != 0) {
                                    locationData.lat = value.latitude;
                                    locationData.lng = value.longitude;

//!!!!!
                                    //** This is the code for getting the name of the city out of the coodinates of the Training center */
                                    fetchCityName(locationData.lat!,
                                            locationData.lng!)
                                        .then(
                                      (value) {
                                        locationData.city =
                                            value == "null" ? "" : value;
                                        _location.text = locationData.city!;
                                      },
                                    );
                                  } else {
                                    _location.text = "";
                                  }
                                },
                              );
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[a-zA-Z\u0621-\u064A]+'))
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextField(
                                  onTap: _openTime.text.isEmpty
                                      ? () {
                                          Fluttertoast.showToast(
                                              msg: languageType == 0
                                                  ? "عليك اختيار وقت الفتح قبل"
                                                  : "You have to add openTime before.");
                                        }
                                      : () async => {
                                            await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              if (value != null)
                                                _closeTime.text =
                                                    "${value!.hour}:${value.minute}";
                                              _closeDouble = double.parse(
                                                  "${value!.hour}.${value.minute}");
                                            }),
                                          },
                                  readOnly: true,
                                  controller: _closeTime,
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
                                    await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      if (value != null)
                                        _openTime.text =
                                            "${value!.hour}:${value.minute}";
                                      _openDouble = double.parse(
                                          "${value!.hour}.${value.minute}");
                                    }),
                                  },
                                  readOnly: true,
                                  controller: _openTime,
                                  decoration: InputDecoration(
                                    label: Text((languageType == 0)
                                        ? "وقت الفتح"
                                        : "openTime"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                      Focus(
                        onFocusChange: (value) {
                          if (!value) {
                            setState(
                              () {
                                if (!(_trainingCenterPhoneNumber.text
                                        .startsWith("091") ||
                                    _trainingCenterPhoneNumber.text
                                        .startsWith("092") ||
                                    _trainingCenterPhoneNumber.text
                                        .startsWith("094") ||
                                    _trainingCenterPhoneNumber.text
                                        .startsWith("095"))) {
                                  _showTrainingCenterPhoneNumberErrorMessage =
                                      true;
                                } else {
                                  _showTrainingCenterPhoneNumberErrorMessage =
                                      false;
                                }
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            onTap: () {
                              if (_trainingCenterPhoneNumber.selection ==
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _trainingCenterPhoneNumber
                                              .text.length -
                                          1))) {
                                _trainingCenterPhoneNumber.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _trainingCenterPhoneNumber
                                            .text.length));
                              }
                            },
                            controller: _trainingCenterPhoneNumber,
                            selectionControls: EmptyTextSelectionControls(),
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 10,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              counterText: "",
                              label: Row(children: [
                                const Icon(
                                  Icons.phone,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (languageType == 0)
                                      ? "رقم هاتف مركز التدريب"
                                      : "Phone Number",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text("*",
                                    style: TextStyle(color: Colors.red)),
                              ]),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _showTrainingCenterPhoneNumberErrorMessage,
                        child: Text(
                          languageType == 0
                              ? "رقم الهاتف يجب ان يبدأ ب 091 أو 092 أو 094 أو 095"
                              : "Phone number  needs to starts with 091,092,094,095",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_website.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset: _website.text.length - 1))) {
                              _website.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _website.text.length));
                            }
                          },
                          controller: _website,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 120,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              const Icon(
                                Icons.web,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "موقع مركز التدريب"
                                    : "Training center website",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_facebook.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset: _facebook.text.length - 1))) {
                              _facebook.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _facebook.text.length));
                            }
                          },
                          onChanged: (value) {},
                          controller: _facebook,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 250,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              const Icon(
                                Icons.facebook,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "صفحة الفيسبوك"
                                    : "Facebook Page",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_whatsapp.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset: _whatsapp.text.length - 1))) {
                              _whatsapp.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _whatsapp.text.length));
                            }
                          },
                          controller: _whatsapp,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 10,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Image.asset(
                                "Assets/Icons/whatsapp.png",
                                height: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "رقم الواتس اب"
                                    : "Whatsapp number",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ]),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Text(languageType == 0
                          ? "عليك كتابة على الاقل 100 حرف"
                          : "You have to write at least a 100 letters"),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onTap: () {
                            if (_description.selection ==
                                TextSelection.fromPosition(TextPosition(
                                    offset: _description.text.length - 1))) {
                              _description.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: _description.text.length));
                            }
                          },
                          onChanged: (value) {},
                          controller: _description,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLines: 50,
                          minLines: 1,
                          textAlign: TextAlign.start,
                          maxLength: 2500,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            label: Row(
                              children: [
                                Text(
                                  (languageType == 0)
                                      ? "معلومات عن المركز"
                                      : "Description",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text("*",
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      MultiSelectDialogField(
                        items: tags
                            .map((e) => MultiSelectItem(e,
                                (languageType == 0) ? e.name_ar! : e.name_en!))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          _selectedTags = values;
                        },
                        cancelText:
                            Text((languageType == 0) ? "إلغاء" : "Cancel"),
                        confirmText: Text((languageType == 0) ? "موافق" : "OK"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color:
                                isDark ? Color(0xff424242) : Color(0xffdddddd),
                          ),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "قم بتحميل صورة مركز التدريب"
                                  : "Upload your Training Center picture",
                              style: TextStyle(
                                  fontSize: ((languageType == 0) ? 20 : 16)),
                            ),
                            const Text("*",
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("الصورة", style: TextStyle(fontSize: 18)),
                          ),
                          _image != null
                              ? Image.file(
                                  _image!,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  image: const AssetImage(
                                      "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                                  height: 200,
                                ),
                          ElevatedButton(
                              onPressed: getImage,
                              child: Text(
                                (languageType == 0)
                                    ? "اختر الصورة"
                                    : "Pic Imgae",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("الشعار",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            _logo != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 60.3,
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                      child: Image.file(
                                        _logo!,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.6,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: const AssetImage(
                                          "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                                      height: 150,
                                    ),
                                  ),
                            ElevatedButton(
                                onPressed: getLogo,
                                child: Text(
                                  (languageType == 0)
                                      ? "اختر الشعار"
                                      : "Pic Logo",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Step(
                    isActive: _index == 1,
                    title: Text((languageType == 0) ? "الملخص" : "overview"),
                    content: Column(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: const AssetImage(
                            "Assets/Images/techny-receiving-a-letter-or-email.png"),
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          (languageType == 0)
                              ? "مراجعة بياناتك"
                              : "Review your Data.",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "رقم جواز السفر الشخصي:"
                                  : "Personal Passport ID:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _id.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20, bottom: 20),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         (languageType == 0)
                      //             ? "اسم المؤسسة:"
                      //             : "Orgnaization Name:",
                      //         style: const TextStyle(
                      //             fontSize: 14, fontWeight: FontWeight.bold),
                      //       ),
                      //       const SizedBox(width: 10),
                      //       Text(
                      //         _companyName.text,
                      //         style: const TextStyle(
                      //           fontSize: 14,
                      //           color: Color(0xff1776e0),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "اسم مركز التدريب:"
                                  : "Training Center Name:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _trainingCenterName.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "البريد الالكتروني للمركز:"
                                  : "Training Center Email:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _email.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "عنوان مركز التدريب:"
                                  : "Training center address:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _location.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "رقم هاتف مركز التدريب:"
                                  : "Training center Phone Number:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _trainingCenterPhoneNumber.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (_website.text != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                children: [
                                  Text(
                                    (languageType == 0)
                                        ? "موقع مركز التدريب:"
                                        : "Training center website:",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _website.text,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff1776e0),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      (_facebook.text != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                children: [
                                  Text(
                                    (languageType == 0)
                                        ? "صفحة الفيسبوك:"
                                        : "Facebook Page:",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _facebook.text,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff1776e0),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      (_whatsapp.text != '')
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                children: [
                                  Text(
                                    (languageType == 0)
                                        ? "رقم الواتس اب:"
                                        : "Whatsapp number:",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _whatsapp.text,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff1776e0),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextField(
                                onTap: null,
                                readOnly: true,
                                controller: _openTime,
                                style: TextStyle(
                                    color:
                                        isDark ? Colors.white : Colors.black),
                                decoration: InputDecoration(
                                  label: Text((languageType == 0)
                                      ? "وقت الفتح"
                                      : "openTime"),
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
                                onTap: null,
                                readOnly: true,
                                controller: _closeTime,
                                style: TextStyle(
                                    color:
                                        isDark ? Colors.white : Colors.black),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "معلومات عن المركز:"
                                  : "Training center description:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _description.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff1776e0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "معلومات عن المركز:"
                                  : "Training center description:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Wrap(
                              children: [
                                for (var item in _SearchBoxTags)
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TagChip(
                                      passiveBackgroundColor: (isDark)
                                          ? const Color.fromRGBO(
                                              250, 250, 250, 0.5)
                                          : const Color.fromRGBO(
                                              200, 200, 200, 0.5),
                                      selected: [],
                                      tag: tags[item],
                                    ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        (languageType == 0)
                            ? "صورة مركز التدريب:"
                            : "Training center image:",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),

                      _image != null
                          ? Image.file(
                              _image!,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image(
                              width: MediaQuery.of(context).size.width,
                              image: const AssetImage(
                                  "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                              height: 150,
                            ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                    ]),
                  )
                ],
                currentStep: _index,
                onStepContinue: () async {
                  if (_index < 1) {
                    setState(() {
                      _index++;
                    });
                  } else {
                    List<int> tagsNum = [];
                    _selectedTags.forEach(
                      (element) {
                        tagsNum.add(element.id!);
                      },
                    );
                    FormData form = FormData.fromMap({
                      'description': _description.text,
                      'email': _email.text,
                      'image': await MultipartFile.fromFile(_image!.path,
                          filename: _image!.path.split('/').last),
                      'imageName': _image!.path.split('/').last,
                      'logo': await MultipartFile.fromFile(_logo!.path,
                          filename: _logo!.path.split('/').last),
                      'logoName': _logo!.path.split('/').last,
                      'openTime': _openDouble,
                      'name': _trainingCenterName.text,
                      'closeTime': _closeDouble,
                      'passportID': _id.text,
                      'longitude': locationData.lng,
                      'latitude': locationData.lat,
                      'locName': _location.text,
                      'phonenumber': _trainingCenterPhoneNumber.text,
                      'website': _website.text,
                      'facebook': _facebook.text,
                      'whatsapp': _whatsapp.text,
                      'tags': {for (var element in tagsNum) element},
                      'userID': user.id
                    });

                    SendData(form);
                    Fluttertoast.showToast(
                        msg: (languageType == 0)
                            ? "تم إرسال الطلب للمراجعة"
                            : "Request has been sent to get reviewed");
                    // Navigator.of(context).pop();
                  }
                },
                onStepCancel: () => setState(() {
                  if (_index > 0) {
                    _index--;
                  }
                }),
                type: StepperType.horizontal,
                elevation: 0,
              ),
            ),
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

  Future getLogo() async {
    final logo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (logo == null) return;
    final imageTemp = File(logo.path);
    setState(() {
      _logo = imageTemp;
    });
  }

  Future<String> fetchCityName(double lat, double lng) async {
    GeoData address = await Geocoder2.getDataFromCoordinates(
      language: "AR",
      latitude: lat,
      longitude: lng,
      googleMapApiKey: "AIzaSyBbg24GYIH8LvMFHWMkK7QGqLcsMMk0n3w",
    );

    var first = address.address;
    return first.toString();
  }

  Future SendData(FormData tc) async {
    var url = "tc/add";
    try {
      var response = await dioTestApi.post(url, data: tc);
      if (response.statusCode == 200) {
        print(response.data);
        Fluttertoast.showToast(msg: "Request sent.");
      } else {
        Fluttertoast.showToast(msg: "Request not sent check server status");
      }
    } catch (exception) {
      print(exception);
      Fluttertoast.showToast(
          msg: "There was an error connecting to the Server");
    }
  }
}
