import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../Classes/GlobalVariables.dart';

class AddTrainingCenterPage extends StatefulWidget {
  const AddTrainingCenterPage({super.key});

  @override
  State<AddTrainingCenterPage> createState() => _AddTrainingCenterPageState();
}

class _AddTrainingCenterPageState extends State<AddTrainingCenterPage> {
  int _index = 0, _secretCode = 0;
  bool codeCheck = false;
  TextEditingController _id = TextEditingController(),
      _companyName = TextEditingController(),
      _phoneNumber = TextEditingController(),
      _code = TextEditingController(),
      _trainingCenterName = TextEditingController(),
      _email = TextEditingController(),
      _address = TextEditingController(),
      _trainingCenterPhoneNumber = TextEditingController(),
      _website = TextEditingController(),
      _facebook = TextEditingController(),
      _description = TextEditingController();

  //!!!!!!!!!!!

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.95),
            width: double.infinity,
            child: Stepper(
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      child: Text((languageType == 0) ? "التالي" : "Next"),
                      onPressed: () {
                        if (_index == 0) {
                          details.onStepContinue;
                        }
                      },
                    ),
                    ElevatedButton(
                      child: Text((languageType == 0) ? "الرجوع" : "Back"),
                      onPressed: () {},
                    )
                  ],
                );
              },
              margin: EdgeInsets.all(0),
              steps: [
                Step(
                    isActive: _index == 0,
                    title: Text("Personal"),
                    content: Column(
                      children: [
                        Image(
                          width: MediaQuery.of(context).size.width,
                          image: AssetImage(
                              "Assets/Images/techny-patient-card-and-tests.png"),
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            (languageType == 0)
                                ? "أكمل بياناتك الشخصية لكي تضيف مركز التدريب الخاص بك."
                                : "Complete Personal Info to add your Training Center.",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _id,
                            selectionControls: EmptyTextSelectionControls(),
                            maxLengthEnforcement: MaxLengthEnforcement
                                .truncateAfterCompositionEnds,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            maxLength: 32,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              counterText: "",
                              label: Row(children: [
                                Icon(
                                  Icons.perm_identity,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (languageType == 0)
                                      ? "الرقم الوظني أو رقم الجواز"
                                      : "NationalID/PassportID",
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
                            controller: _companyName,
                            selectionControls: EmptyTextSelectionControls(),
                            maxLengthEnforcement: MaxLengthEnforcement
                                .truncateAfterCompositionEnds,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            maxLength: 32,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              counterText: "",
                              label: Row(children: [
                                Icon(
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
                            controller: _phoneNumber,
                            selectionControls: EmptyTextSelectionControls(),
                            maxLengthEnforcement: MaxLengthEnforcement
                                .truncateAfterCompositionEnds,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            maxLength: 32,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              counterText: "",
                              label: Row(children: [
                                Icon(
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
                              ]),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
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
                    )),
                Step(
                  isActive: _index == 1,
                  title: Text("Info"),
                  content: SizedBox(
                    height: (MediaQuery.of(context).size.height),
                    child: Column(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: AssetImage(
                            "Assets/Images/handy-line-web-design-browser 1.png"),
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          (languageType == 0)
                              ? "قم بتعبئة بيانات مركز التدريب"
                              : "Fill out the Training Center Information.",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          controller: _trainingCenterName,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
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
                          controller: _email,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
                                Icons.mail,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "البريد الالكتروني للمركز"
                                    : "Email",
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
                          controller: _address,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
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
                          controller: _trainingCenterPhoneNumber,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
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
                          controller: _website,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
                                Icons.web,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "الموقع الالكتروني"
                                    : "Website",
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
                          controller: _facebook,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          maxLength: 32,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Row(children: [
                              Icon(
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
                          controller: _description,
                          selectionControls: EmptyTextSelectionControls(),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          maxLength: 1000,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            counterText: "",
                            label: Text(
                              (languageType == 0)
                                  ? "معلومات عن المركز"
                                  : "Description",
                              style: const TextStyle(fontSize: 16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Step(
                  isActive: _index == 2,
                  title: Text("Image"),
                  content: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        (languageType == 0)
                            ? "فم بتحميل صورة مركز التدريب"
                            : "Upload your Training Center picture",
                        style: TextStyle(fontSize: 20),
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
                            image: AssetImage(
                                "Assets/Images/techny-tablet-with-stylus-for-design.png"),
                            height: 150,
                          ),
                    OutlinedButton(
                        child: Text("Pic Imgae"), onPressed: getImage),
                  ]),
                )
              ],
              currentStep: _index,
              onStepContinue: () => setState(() {
                if (_index < 2) {
                  _index++;
                } else {
                  Fluttertoast.showToast(
                      msg: "Request has been sent to get reviewed");
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
