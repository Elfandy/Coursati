import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Classes/TrainingCenter.dart';

class TrainingCenterPage extends StatefulWidget {
  const TrainingCenterPage({super.key, required this.name});
  final String name;

  @override
  State<TrainingCenterPage> createState() => _TrainingCenterPageState();
}

class _TrainingCenterPageState extends State<TrainingCenterPage> {
  TrainingCenter _trainingCenter = TrainingCenter(
    branch: null,
    close: TimeOfDay(hour: 0, minute: 0),
    description: """""",
    email: "",
    id: 0,
    location: locations[1],
    name: "",
    open: TimeOfDay(hour: 0, minute: 0),
    phoneNumber: "",
    rating: 0.0,
    tags: [tags[0]],
    image: "",
    logo: "",
  );
  TrainingCenter? _temp;
  bool _found = false, _isEven = false;
  //*************************************************************************** */
  @override
  Widget build(BuildContext context) {
//! This is for the repeated widgets

    TextStyle _tagsStyle = TextStyle(color: Color(0xff1776e0), fontSize: 18),
        _branchStyle = TextStyle(fontSize: 16),
        _labeleStyle = TextStyle(color: Color(0xff1776e0), fontSize: 22);
    EdgeInsets _labelPad = EdgeInsets.fromLTRB(20, 10, 20, 10);

    //??????????????????????????????????????????????????????????????????????????????????
    if ((_temp = getTCData(widget.name)) != null) {
      _found = true;
      _trainingCenter = _temp!;
    }

    if (_found) {
      //************************************************************************* */
      return Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            //? This is the image code
            Container(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(
                  image: CachedNetworkImageProvider(
                    _trainingCenter.image,
                  ),
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            Padding(
              padding: const EdgeInsets.only(top: 270),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? This is the logo and the name of the center
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: Text(
                              ((languageType == 0)
                                  ? "مركز " + _trainingCenter.name
                                  : _trainingCenter.name + " Center"),
                              style: TextStyle(fontSize: 36),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                image: CachedNetworkImageProvider(
                                  _trainingCenter.logo,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? this is the location of the main branch of the center

                      Padding(
                        padding: _labelPad,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "Assets/Icons/map-pin-location.png",
                              scale: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              (languageType == 0)
                                  ? _trainingCenter.location.city_ar
                                  : _trainingCenter.location.city_en,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),

                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //?This is the branches place of the center
                      (_trainingCenter.branch != null)
                          ? Padding(
                              padding: _labelPad,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (languageType == 0) ? "الفروع" : "Branches",
                                    style: _labeleStyle,
                                  ),
                                  for (int i = 0, j = 1;
                                      i < _trainingCenter.branch!.length;
                                      i = i + 2, j = i + 1)
                                    (_trainingCenter.branch!.length % 2 == 0)
                                        ? Row(
                                            children: [
                                              Padding(
                                                  padding: _labelPad,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          "Assets/Icons/map-pin-location.png",
                                                          scale: 3,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          (languageType == 0)
                                                              ? _trainingCenter
                                                                  .branch![i]
                                                                  .location
                                                                  .city_ar
                                                              : _trainingCenter
                                                                  .branch![i]
                                                                  .location
                                                                  .city_en,
                                                          style: _branchStyle,
                                                        ),
                                                      ])),
                                              Padding(
                                                  padding: _labelPad,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          "Assets/Icons/map-pin-location.png",
                                                          scale: 3,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          (languageType == 0)
                                                              ? _trainingCenter
                                                                  .branch![j]
                                                                  .location
                                                                  .city_ar
                                                              : _trainingCenter
                                                                  .branch![j]
                                                                  .location
                                                                  .city_en,
                                                          style: _branchStyle,
                                                        ),
                                                      ])),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Padding(
                                                  padding: _labelPad,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          "Assets/Icons/map-pin-location.png",
                                                          scale: 3,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          (languageType == 0)
                                                              ? _trainingCenter
                                                                  .branch![i]
                                                                  .location
                                                                  .city_ar
                                                              : _trainingCenter
                                                                  .branch![i]
                                                                  .location
                                                                  .city_en,
                                                          style: _branchStyle,
                                                        ),
                                                      ])),
                                              (i !=
                                                      _trainingCenter
                                                              .branch!.length -
                                                          1)
                                                  ? Padding(
                                                      padding: _labelPad,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.asset(
                                                              "Assets/Icons/map-pin-location.png",
                                                              scale: 3,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              (languageType ==
                                                                      0)
                                                                  ? _trainingCenter
                                                                      .branch![
                                                                          j]
                                                                      .location
                                                                      .city_ar
                                                                  : _trainingCenter
                                                                      .branch![
                                                                          j]
                                                                      .location
                                                                      .city_en,
                                                              style:
                                                                  _branchStyle,
                                                            )
                                                          ]))
                                                  : Container(),
                                            ],
                                          )
                                ],
                              ),
                            )
                          : Container(),

                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? this is the tags place of the center
                      Padding(
                        padding: _labelPad,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (languageType == 0) ? "الوسوم" : "Tags",
                              style: _labeleStyle,
                            ),
                            for (int i = 0, j = 1;
                                i < _trainingCenter.tags.length;
                                i = i + 2, j = i + 1)
                              (_trainingCenter.tags.length % 2 == 0)
                                  ? Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffdddddd)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                (languageType == 0)
                                                    ? _trainingCenter
                                                        .tags[i].name_ar
                                                    : _trainingCenter
                                                        .tags[i].name_en,
                                                style: _tagsStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffdddddd)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                (languageType == 0)
                                                    ? _trainingCenter
                                                        .tags[j].name_ar
                                                    : _trainingCenter
                                                        .tags[j].name_en,
                                                style: _tagsStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffdddddd)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                (languageType == 0)
                                                    ? _trainingCenter
                                                        .tags[i].name_ar
                                                    : _trainingCenter
                                                        .tags[i].name_en,
                                                style: _tagsStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        (i != _trainingCenter.tags.length - 1)
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Color(0xffdddddd)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      (languageType == 0)
                                                          ? _trainingCenter
                                                              .tags[j].name_ar
                                                          : _trainingCenter
                                                              .tags[j].name_en,
                                                      style: _tagsStyle,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                          ],
                        ),
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!a
                      //? this is the description

                      Padding(
                        padding: _labelPad,
                        child: Text(
                          (languageType == 0) ? "الوصف" : "Description",
                          style: _labeleStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 30, 10),
                        child: Text(
                          _trainingCenter.description,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //?this is the see our courses section
                      Padding(
                        padding: _labelPad,
                        child: Divider(),
                      ),
                      TextButton(
                        child: Padding(
                          padding: _labelPad,
                          child: Text(
                            "See Our Courses",
                            style: _labeleStyle,
                          ),
                        ),
                        //???????????????? This is for the function of the see our courses
                        onPressed: () {},
                      ),
                      Padding(
                        padding: _labelPad,
                        child: Divider(),
                      ),

                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? This is for the contact us section
                      (_trainingCenter.facebook != "" &&
                              _trainingCenter.website != "")
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: _labelPad,
                                  child: Text(
                                    (languageType == 0)
                                        ? "تواصل معنا"
                                        : "Contact Us",
                                    style: _labeleStyle,
                                  ),
                                ),
                                Row(
                                  children: [
                                    (_trainingCenter.facebook != "")
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.facebook,
                                                      size: 40),
                                                  onPressed: () {},
                                                ),
                                                Text(
                                                  "Facebook",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    (_trainingCenter.website != "")
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.web_asset,
                                                      size: 40),
                                                  onPressed: () {},
                                                ),
                                                Text(
                                                  "Website",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ],
                                )
                              ],
                            )
                          : Container(),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //?this is for the email
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          (languageType == 0) ? "البريد الألكتروني" : "Email",
                          style: _labeleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextButton(
                          child: Text(
                            _trainingCenter.email,
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    (isDark!) ? Colors.white : Colors.black38),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? this is for the phone number
                      //?this is for the email
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          (languageType == 0) ? "رقم الهاتف" : "Phone Number",
                          style: _labeleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextButton(
                          child: Text(
                            _trainingCenter.phoneNumber,
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    (isDark!) ? Colors.white : Colors.black38),
                          ),
                          onPressed: () {},
                        ),
                      ),

                      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //? this is for the legals
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                        child: Text(
                          (languageType == 0)
                              ? "كل المعلومات تم تقديمها بواسطة مركز التدريب"
                              : "All Informations are provided by the Training Center",
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ));
    }
    return (Scaffold(
      body: Center(
        child: Text(
          "No Training Center",
          style: TextStyle(
              color: (isDark!) ? Colors.white : Colors.black, fontSize: 32),
        ),
      ),
    ));
  }

  TrainingCenter? getTCData(String name) {
    for (int i = 0; i < trainingCenterData.length; i++) {
      if (name == trainingCenterData[i].name) {
        return trainingCenterData[i];
      }
    }
    return null;
  }
//! deprecated Function it caculates the image height
  // Future<double> getImageHeight({required String images}) async {
  //   File image = File(images);
  //   var decodedImage = await decodeImageFromList(image.readAsBytesSync());

  //   return decodedImage.height.toDouble();
  // }
}
