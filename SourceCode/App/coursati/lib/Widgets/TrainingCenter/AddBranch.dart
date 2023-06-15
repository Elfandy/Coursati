import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../Classes/Location.dart';
import '../../Classes/TagData.dart';
import '../../Services/ScreenController.dart';
import '../../Widgets/TrainingCenter/SetLoationMap.dart';

class AddBranch extends StatefulWidget {
  const AddBranch({super.key});

  @override
  State<AddBranch> createState() => _AddBranchState();
}

class _AddBranchState extends State<AddBranch> {
  int _index = 0;
  bool codeCheck = false, _emailCheck = false;
  final TextEditingController _email = TextEditingController(),
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
  List<int> _SearchBoxTags = [], _selectTagsNum = [];
  List<Tag> _selectedTags = [];

  //!!!!!!!!!!!

  File? _image;

  bool passsportError = false, orgNameError = false, phoneNumError = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text((languageType == 0) ? "إضافة فرع" : "Add Branch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(children: [
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
                      ? "قم بتعبئة البيانات لطلب إنشاء فرع للمركز التدريبي في المنصة"
                      : "Fill out data to add Branch to your training center in the platform",
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
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
                          TextSelection.fromPosition(
                              TextPosition(offset: _email.text.length - 1))) {
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
                    style: const TextStyle(color: Colors.black, fontSize: 16),
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
                        const Text("*", style: TextStyle(color: Colors.red)),
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
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
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
                      const Text("*", style: TextStyle(color: Colors.red)),
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
                          if (value.latitude != 0 && value.longitude != 0) {
                            locationData.lat = value.latitude;
                            locationData.lng = value.longitude;

                            //!!!!!
                            //** This is the code for getting the name of the city out of the coodinates of the Training center */
                            fetchCityName(locationData.lat!, locationData.lng!)
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
                        if (!(_trainingCenterPhoneNumber.text
                                .startsWith("091") ||
                            _trainingCenterPhoneNumber.text.startsWith("092") ||
                            _trainingCenterPhoneNumber.text.startsWith("094") ||
                            _trainingCenterPhoneNumber.text
                                .startsWith("095"))) {
                          _showTrainingCenterPhoneNumberErrorMessage = true;
                        } else {
                          _showTrainingCenterPhoneNumberErrorMessage = false;
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
                              offset: _trainingCenterPhoneNumber.text.length -
                                  1))) {
                        _trainingCenterPhoneNumber.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset:
                                    _trainingCenterPhoneNumber.text.length));
                      }
                    },
                    controller: _trainingCenterPhoneNumber,
                    selectionControls: EmptyTextSelectionControls(),
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 10,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
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
                        const Text("*", style: TextStyle(color: Colors.red)),
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
                        TextSelection.fromPosition(
                            TextPosition(offset: _website.text.length - 1))) {
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
                  style: const TextStyle(color: Colors.black, fontSize: 16),
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
                        TextSelection.fromPosition(
                            TextPosition(offset: _facebook.text.length - 1))) {
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
                  style: const TextStyle(color: Colors.black, fontSize: 16),
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
                        (languageType == 0) ? "صفحة الفيسبوك" : "Facebook Page",
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
                        TextSelection.fromPosition(
                            TextPosition(offset: _whatsapp.text.length - 1))) {
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
                  style: const TextStyle(color: Colors.black, fontSize: 16),
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
                      _description.selection = TextSelection.fromPosition(
                          TextPosition(offset: _description.text.length));
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
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: InputDecoration(
                    label: Row(
                      children: [
                        Text(
                          (languageType == 0)
                              ? "معلومات عن المركز"
                              : "Description",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Text("*", style: TextStyle(color: Colors.red)),
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
                    .map((e) => MultiSelectItem(
                        e, (languageType == 0) ? e.name_ar! : e.name_en!))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedTags = values;
                },
                cancelText: Text((languageType == 0) ? "إلغاء" : "Cancel"),
                confirmText: Text((languageType == 0) ? "موافق" : "OK"),
                selectedItemsTextStyle: TextStyle(color: Colors.white),
                itemsTextStyle: TextStyle(color: Colors.white),
                selectedColor: Color(0xff1776e0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: isDark ? Color(0xff424242) : Color(0xffdddddd))),
                dialogHeight: MediaQuery.of(context).size.height / 2,
                dialogWidth: MediaQuery.of(context).size.width / 2,
                title: Text(
                  (languageType == 0) ? "أضف وسوم" : "Add Tags",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                buttonText: Text(
                  (languageType == 0) ? "أضف وسوم" : "Add Tags",
                ),
              ),
              //?????????????????????????????????????????
              // Wrap(
              //   children: [
              //     for (var item in _selectTagsNum)
              //       Padding(
              //         padding: const EdgeInsets.all(4.0),
              //         child: TagChip(
              //           passiveBackgroundColor: (isDark)
              //               ? const Color.fromRGBO(250, 250, 250, 0.5)
              //               : const Color.fromRGBO(200, 200, 200, 0.5),
              //           selected: [],
              //           tag: tags[item],
              //         ),
              //       )
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      (languageType == 0)
                          ? "فم بتحميل صورة مركز التدريب"
                          : "Upload your Training Center picture",
                      style:
                          TextStyle(fontSize: ((languageType == 0) ? 20 : 16)),
                    ),
                    const Text("*", style: TextStyle(color: Colors.red)),
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
                  onPressed: getImage,
                  child:
                      Text((languageType == 0) ? "اختر الصورة" : "Pic Imgae")),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width / 1.5, 40)),
                    onPressed: () {
                      SendData();
                    },
                    child: Text(
                      (languageType == 0) ? "أضف فرع" : "Add branch",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
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
    GeoData address = await Geocoder2.getDataFromCoordinates(
        language: "en",
        latitude: lat,
        longitude: lng,
        googleMapApiKey: "AIzaSyBbg24GYIH8LvMFHWMkK7QGqLcsMMk0n3w");

    var first = address.address;
    return first.toString();
  }

  Future SendData() async {
    var dio = Dio();
    var url = '';
    if (_image != null) {
      String filename = _image!.path.split('/').last;

      FormData data = FormData.fromMap({
        'key': 'a61a05535acdc0725e9dd85d8a97d567',
        'image': await MultipartFile.fromFile(_image!.path, filename: filename),
        'name': '$filename'
      });

      var response = await dio.post(
        "https://api.imgbb.com/1/upload",
        data: data,
        onSendProgress: (count, total) {
          print("$count . $total");
        },
      );
    }
  }
}
