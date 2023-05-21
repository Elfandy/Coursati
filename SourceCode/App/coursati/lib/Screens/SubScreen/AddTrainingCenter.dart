import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchfield/searchfield.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/Location.dart';
import '../../Classes/TrainingCenter.dart';
import '../../Services/ScreenController.dart';
import '../../Widgets/TrainingCenter/SetLoationMap.dart';

class AddTrainingCenterPage extends StatefulWidget {
  const AddTrainingCenterPage({super.key});

  @override
  State<AddTrainingCenterPage> createState() => _AddTrainingCenterPageState();
}

class _AddTrainingCenterPageState extends State<AddTrainingCenterPage> {
  int _index = 0, _secretCode = 0;
  bool codeCheck = false, _emailCheck = false;
  TextEditingController _id = TextEditingController(),
      _companyName = TextEditingController(),
      _phoneNumber = TextEditingController(),
      _code = TextEditingController(),
      _trainingCenterName = TextEditingController(),
      _email = TextEditingController(),
      _trainingCenterPhoneNumber = TextEditingController(),
      _location = TextEditingController(),
      _website = TextEditingController(),
      _facebook = TextEditingController(),
      _description = TextEditingController(),
      _whatsapp = TextEditingController();
  String? _dropDownValue;
  Locations locationData = Locations(city: "", id: 0, lat: 0, lng: 0);
  // Location? _dropDownValue = locations.first;

  bool _showPersonalPhonenymberErrorMessage = false,
      _showTrainingCenterPhoneNumberErrorMessage = false;
  //!!!!!!!!!!!

  File? _image;

  bool passsportError = false, orgNameError = false, phoneNumError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                                        _companyName.text != '' &&
                                        _phoneNumber.text != '' &&
                                        (_phoneNumber.text.startsWith("091") ||
                                            _phoneNumber.text
                                                .startsWith("092") ||
                                            _phoneNumber.text
                                                .startsWith("094") ||
                                            _phoneNumber.text
                                                .startsWith("095")))
                                    ? (_id.text.length == 8 &&
                                            _phoneNumber.text.length == 10)
                                        ? details.onStepContinue
                                        : null
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
                                onPressed: (_trainingCenterName.text != '' &&
                                        _email.text != '' &&
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
                                                .startsWith("095")))
                                    ? details.onStepContinue
                                    : null,
                                child: Text(
                                  (languageType == 0) ? "التالي" : "Next",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        else if (_index == 2)
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
                      title: Text((languageType == 0) ? "شخصية" : "Personal"),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image(
                              width: MediaQuery.of(context).size.width,
                              image: const AssetImage(
                                  "Assets/Images/techny-patient-card-and-tests.png"),
                              height: 150,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                (languageType == 0)
                                    ? "أكمل بياناتك الشخصية لكي تضيف مركز التدريب الخاص بك."
                                    : "Complete Personal Info to add your Training Center.",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                onTap: () {
                                  if (_companyName.selection ==
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              _companyName.text.length - 1))) {
                                    _companyName.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _companyName.text.length));
                                  }
                                },
                                controller: _companyName,
                                selectionControls: EmptyTextSelectionControls(),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter,
                                ],
                                maxLength: 32,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: (orgNameError)
                                          ? Colors.red
                                          : Color(0xffdddddd),
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
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
                                          ? "اسم المؤسسة"
                                          : "Orgnaization Name",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text("*",
                                        style: TextStyle(color: Colors.red)),
                                  ]),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),

                            Focus(
                              onFocusChange: (value) {
                                if (!value) {
                                  setState(
                                    () {
                                      if (!(_phoneNumber.text
                                              .startsWith("091") ||
                                          _phoneNumber.text.startsWith("092") ||
                                          _phoneNumber.text.startsWith("094") ||
                                          _phoneNumber.text
                                              .startsWith("095"))) {
                                        _showPersonalPhonenymberErrorMessage =
                                            true;
                                      } else {
                                        _showPersonalPhonenymberErrorMessage =
                                            false;
                                      }
                                    },
                                  );
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextField(
                                  onTap: () {
                                    if (_phoneNumber.selection ==
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _phoneNumber.text.length -
                                                1))) {
                                      _phoneNumber.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: _phoneNumber
                                                      .text.length));
                                    }
                                  },
                                  controller: _phoneNumber,
                                  selectionControls:
                                      EmptyTextSelectionControls(),
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maxLength: 10,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            (_showPersonalPhonenymberErrorMessage)
                                                ? Colors.red
                                                : Color(0xffdddddd),
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    counterText: "",
                                    label: Row(children: [
                                      const Icon(
                                        Icons.phone_android,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        (languageType == 0)
                                            ? "رقم الهاتف"
                                            : "PhoneNumber",
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
                              visible: _showPersonalPhonenymberErrorMessage,
                              child: Text(
                                languageType == 0
                                    ? "رقم الهاتف يجب ان يبدأ ب 091 أو 092 أو 094 أو 095"
                                    : "Phone number needs to starts with 091,092,094,095",
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
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
                          ],
                        ),
                      )),
                  Step(
                    isActive: _index == 1,
                    title: Text((languageType == 0)
                        ? "مركز التدريب"
                        : "Training Center"),
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
                              ? "قم بتعبئة بيانات مركز التدريب"
                              : "Fill out the Training Center Information.",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
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
                                  _emailCheck = true;
                                } else {
                                  _emailCheck = false;
                                }
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
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
                                if (!(_trainingCenterName.text
                                        .startsWith("091") ||
                                    _trainingCenterName.text
                                        .startsWith("092") ||
                                    _trainingCenterName.text
                                        .startsWith("094") ||
                                    _trainingCenterName.text
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "فم بتحميل صورة مركز التدريب"
                                  : "Upload your Training Center picture",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Text("*",
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      _image != null
                          ? Image.file(
                              _image!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image(
                              width: MediaQuery.of(context).size.width,
                              image: const AssetImage(
                                  "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                              height: 150,
                            ),
                      OutlinedButton(
                          onPressed: getImage, child: const Text("Pic Imgae")),
                    ]),
                  ),
                  Step(
                    isActive: _index == 2,
                    title: Text((languageType == 0) ? "ملخص" : "overview"),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              (languageType == 0)
                                  ? "اسم المؤسسة:"
                                  : "Orgnaization Name:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _companyName.text,
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
                                  ? "رقم الهاتف الشخصي:"
                                  : "Personal phone Number:",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _phoneNumber.text,
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
                              _location.text ,
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
                onStepContinue: () => setState(() {
                  if (_index < 2) {
                    _index++;
                  } else {
                    Fluttertoast.showToast(
                        msg: (languageType == 0)
                            ? "تم إرسال الطلب للمراجعة"
                            : "Request has been sent to get reviewed");
                    Navigator.of(context).pop();
                  }
                }),
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

  Future<String> fetchCityName(double lat, double lng) async {
    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(locationData.lat, locationData.lng));
    var first = address.first;
    return first.locality.toString();
  }

  Future SendData(TrainingCenter tc)async {
    
  }
}
