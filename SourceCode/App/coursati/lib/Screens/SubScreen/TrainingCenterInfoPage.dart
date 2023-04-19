import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Classes/GlobalVariables.dart';

import '../../Classes/TrainingCenter.dart';
import 'CoursesViewPage.dart';

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

    TextStyle _tagsStyle = TextStyle(
            color: Color(0xff1776e0), fontSize: (languageType == 0) ? 16 : 16),
        _branchStyle = TextStyle(fontSize: 16),
        _labeleStyle = TextStyle(
            color: Color(0xff1776e0), fontSize: (languageType == 0) ? 22 : 20);
    EdgeInsets _labelPad = EdgeInsets.fromLTRB(20, 10, 20, 10);

    //??????????????????????????????????????????????????????????????????????????????????
    if ((_temp = getTCData(widget.name)) != null) {
      _found = true;
      _trainingCenter = _temp!;
    }

    if (_found) {
      //************************************************************************* */

      return Scaffold(
          body: SafeArea(
              child: Stack(children: [
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //? This is the image code
        Container(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CachedNetworkImage(
              imageUrl: _trainingCenter.image,
              errorWidget: (context, url, error) => Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(value: progress.progress)),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
        ),
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        SingleChildScrollView(
            child: Column(
          children: [
            InkWell(
              child: SizedBox(
                height: 270,
                width: double.infinity,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              decoration: BoxDecoration(
                  color: (isDark!) ? Colors.grey[800] : Colors.white,
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
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 1.7),
                            height: 100,
                            child: TextButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: _trainingCenter.name));
                                Fluttertoast.showToast(
                                    msg:
                                        "${_trainingCenter.name} copyed to clipboard",
                                    backgroundColor: Color(0xff999999),
                                    gravity: ToastGravity.BOTTOM);
                              },
                              child: Text(
                                ((languageType == 0)
                                    ? "مركز ${_trainingCenter.name}"
                                    : "${_trainingCenter.name} Center"),
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xff1776e0),
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: (isDark!) ? Colors.white : null,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image(
                                image: CachedNetworkImageProvider(
                                  _trainingCenter.logo,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 30,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            (languageType == 0)
                                ? "اوقات العمل:"
                                : "Working Hours:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (languageType == 0)
                                ? " ${_trainingCenter.open.hour}:${(_trainingCenter.open.minute.toInt() < 10) ? "0${_trainingCenter.open.minute}" : _trainingCenter.open.minute.toString()} - ${_trainingCenter.close.hour}:${(_trainingCenter.close.minute.toInt() < 10) ? "0${_trainingCenter.close.minute}" : _trainingCenter.close.minute.toString()}"
                                : " ${_trainingCenter.open.hour}:${(_trainingCenter.open.minute.toInt() < 10) ? "0${_trainingCenter.open.minute}" : _trainingCenter.open.minute.toString()} - ${_trainingCenter.close.hour}:${(_trainingCenter.close.minute.toInt() < 10) ? "0${_trainingCenter.close.minute}" : _trainingCenter.close.minute.toString()}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //? this is the location of the main branch of the center
                    Padding(
                      padding: _labelPad,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            child: Image.asset(
                              "Assets/Icons/map-pin-location.png",
                              color: (isDark!) ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            (languageType == 0) ? "العنوان: " : "ِAddress: ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (languageType == 0)
                                ? _trainingCenter.location.city_ar
                                : _trainingCenter.location.city_en,
                            style: TextStyle(fontSize: 16),
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

                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      for (int i = 0;
                                          i < _trainingCenter.branch!.length;
                                          i++)
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 25,
                                                height: 25,
                                                child: Image.asset(
                                                  "Assets/Icons/map-pin-location.png",
                                                  color: (isDark!)
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                (languageType == 0)
                                                    ? _trainingCenter.branch![i]
                                                        .location.city_ar
                                                    : _trainingCenter.branch![i]
                                                        .location.city_en,
                                                style: _branchStyle,
                                              ),
                                            ]),
                                    ],
                                  ),

                                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                  //? this is the tags place of the center
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          (languageType == 0)
                                              ? "الوسوم"
                                              : "Tags",
                                          style: _labeleStyle,
                                        ),
                                      ),
                                      Wrap(
                                        children: [
                                          for (int i = 0;
                                              i < _trainingCenter.tags.length;
                                              i++)
                                            Padding(
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
                                        ],
                                      )
                                    ],
                                  )
                                ]))
                        : Container(),
                    //* Second try of the tags place

                    // Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child:

                    //     )),

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
                          (languageType == 0)
                              ? "تفحص دوراتنا"
                              : "See Our Courses",
                          style: _labeleStyle,
                        ),
                      ),
                      //???????????????? This is for the function of the see our courses
                      onPressed: () {
                        Navigator.of(context).push(ScreenController()
                            .createRoute(CoursesViewPage(), 1));
                      },
                    ),
                    Padding(
                      padding: _labelPad,
                      child: Divider(),
                    ),

                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //? This is for the contact us section
                    (_trainingCenter.facebook != "" ||
                            _trainingCenter.website != "" ||
                            _trainingCenter.ViperAllow ||
                            _trainingCenter.WhatsAppAllow)
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
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
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
                                                  onPressed: () {
                                                    _launchSocial(
                                                        _trainingCenter
                                                            .facebook);
                                                  },
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
                                                  onPressed: () {
                                                    _launchSocial(
                                                        _trainingCenter
                                                            .website);
                                                  },
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
                                    (_trainingCenter.WhatsAppAllow)
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  child: TextButton(
                                                    child: Image.asset(
                                                        "Assets/Icons/whatsapp.png",
                                                        color: (isDark!)
                                                            ? Colors.white
                                                            : Colors.black),
                                                    onPressed: () {
                                                      _launchSocial(
                                                          _trainingCenter
                                                              .whatsApp);
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  "WhatsApp",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    //! this is for viper
                                    // (_trainingCenter.ViperAllow)
                                    //     ? Padding(
                                    //         padding:
                                    //             const EdgeInsets.fromLTRB(
                                    //                 20, 0, 20, 0),
                                    //         child: Column(
                                    //           children: [
                                    //             Container(
                                    //               width: 45,
                                    //               height: 45,
                                    //               child: TextButton(
                                    //                 child: Image.asset(
                                    //                     "Assets/Icons/viber.png"),
                                    //                 onPressed: () {
                                    //                   _launchSocial(
                                    //                       _trainingCenter
                                    //                           .viper);
                                    //                 },
                                    //               ),
                                    //             ),
                                    //             Text(
                                    //               "Viper",
                                    //               style: TextStyle(
                                    //                   fontWeight:
                                    //                       FontWeight.bold),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
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
                              color: (isDark!) ? Colors.white : Colors.black38),
                        ),
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: _trainingCenter.phoneNumber));
                          Fluttertoast.showToast(
                              msg: "Email copyed to clipboard",
                              backgroundColor: Color(0xff999999),
                              gravity: ToastGravity.BOTTOM);
                        },
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
                          onPressed: () async {
                            //! this is for copying number to dailer
                            // Uri phoneno =
                            //     Uri.parse('tel:${_trainingCenter.phoneNumber}');
                            // if (await launchUrl(phoneno)) {
                            //   //dialer opened
                            // } else {
                            //   //dailer is not opened
                            // }

                            //! this is for copying number to clipboard
                            // await Clipboard.setData(ClipboardData(
                            //     text: _trainingCenter.phoneNumber));
                            // Fluttertoast.showToast(
                            //     msg: "copyed to clipboard",
                            //     backgroundColor: Color(0xff999999),
                            //     gravity: ToastGravity.BOTTOM);

                            //! this id for copying number to dailer
                            _launchSocial("tel:${_trainingCenter.phoneNumber}");
                          }),
                    ),

                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //? this is for the legals
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                      child: Text(
                        (languageType == 0)
                            ? "كل المعلومات الموجودة تم تقديمها بواسطة مركز التدريب"
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
          ],
        )),
      ])));
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

  void _launchSocial(String _url) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)

    if (!await launchUrl(Uri.parse(_url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
    // await launchUrl(Uri.https(url),mode: LaunchMode.externalApplication ,);
  }
//! deprecated Function it caculates the image height
  // Future<double> getImageHeight({required String images}) async {
  //   File image = File(images);
  //   var decodedImage = await decodeImageFromList(image.readAsBytesSync());

  //   return decodedImage.height.toDouble();
  // }
}
