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
  const TrainingCenterPage({super.key, required this.id});
  final String id;

  @override
  State<TrainingCenterPage> createState() => _TrainingCenterPageState();
}

class _TrainingCenterPageState extends State<TrainingCenterPage> {
  bool _found = false, _isEven = false;
  //*************************************************************************** */
  @override
  Widget build(BuildContext context) {
//! This is for the repeated widgets

    TextStyle _tagsStyle = TextStyle(
            color: const Color(0xff1776e0),
            fontSize: (languageType == 0) ? 16 : 16),
        _branchStyle = const TextStyle(fontSize: 16),
        _labeleStyle = TextStyle(
            color: const Color(0xff1776e0),
            fontSize: (languageType == 0) ? 22 : 20);
    EdgeInsets _labelPad = const EdgeInsets.fromLTRB(20, 10, 20, 10);

    //??????????????????????????????????????????????????????????????????????????????????

    //************************************************************************* */

    return Scaffold(
        body: FutureBuilder(
      future: getTCData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          TrainingCenter _trainingCenter = snapshot.data!;
          return SafeArea(
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                      child:
                          CircularProgressIndicator(value: progress.progress)),
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
                  child: const SizedBox(
                    height: 270,
                    width: double.infinity,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      color: (isDark) ? Colors.grey[800] : Colors.white,
                      borderRadius: const BorderRadius.only(
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
                                width:
                                    (MediaQuery.of(context).size.width / 1.7),
                                height: 100,
                                child: TextButton(
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: _trainingCenter.name));
                                    Fluttertoast.showToast(
                                        msg:
                                            "${_trainingCenter.name} copyed to clipboard",
                                        backgroundColor:
                                            const Color(0xff999999),
                                        gravity: ToastGravity.BOTTOM);
                                  },
                                  child: Text(
                                    ((languageType == 0)
                                        ? "مركز ${_trainingCenter.name}"
                                        : "${_trainingCenter.name} Center"),
                                    style: const TextStyle(
                                      fontSize: 32,
                                      color: Color(0xff1776e0),
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: (isDark) ? Colors.white : null,
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
                              const Icon(
                                Icons.access_time,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "اوقات العمل:"
                                    : "Working Hours:",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (languageType == 0)
                                    ? " ${_trainingCenter.open.hour}:${(_trainingCenter.open.minute.toInt() < 10) ? "0${_trainingCenter.open.minute}" : _trainingCenter.open.minute.toString()} - ${_trainingCenter.close.hour}:${(_trainingCenter.close.minute.toInt() < 10) ? "0${_trainingCenter.close.minute}" : _trainingCenter.close.minute.toString()}"
                                    : " ${_trainingCenter.open.hour}:${(_trainingCenter.open.minute.toInt() < 10) ? "0${_trainingCenter.open.minute}" : _trainingCenter.open.minute.toString()} - ${_trainingCenter.close.hour}:${(_trainingCenter.close.minute.toInt() < 10) ? "0${_trainingCenter.close.minute}" : _trainingCenter.close.minute.toString()}",
                                style: const TextStyle(fontSize: 16),
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
                                  color: (isDark) ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (languageType == 0)
                                    ? "العنوان: "
                                    : "ِAddress: ",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _trainingCenter.location.city!,
                                style: const TextStyle(fontSize: 16),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (languageType == 0)
                                            ? "الفروع"
                                            : "Branches",
                                        style: _labeleStyle,
                                      ),

                                      Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  _trainingCenter
                                                      .branch!.length;
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
                                                      color: (isDark)
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    _trainingCenter.branch![i]
                                                        .location.city!,
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
                                            padding:
                                                const EdgeInsets.only(top: 20),
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
                                                  i <
                                                      _trainingCenter
                                                          .tags.length;
                                                  i++)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xffdddddd)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        (languageType == 0)
                                                            ? _trainingCenter
                                                                .tags[i]
                                                                .name_ar!
                                                            : _trainingCenter
                                                                .tags[i]
                                                                .name_en!,
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
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Text(
                            _trainingCenter.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //?this is the see our courses section
                        Padding(
                          padding: _labelPad,
                          child: const Divider(),
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
                                .createRoute(const CoursesViewPage(), 1));
                          },
                        ),
                        Padding(
                          padding: _labelPad,
                          child: const Divider(),
                        ),

                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is for the contact us section
                        (_trainingCenter.facebook != "" ||
                                _trainingCenter.website != "" ||
                                _trainingCenter.viperAllow ||
                                _trainingCenter.whatsAppNum != "")
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.facebook,
                                                          size: 40),
                                                      onPressed: () {
                                                        _launchSocial(
                                                            _trainingCenter
                                                                .facebook);
                                                      },
                                                    ),
                                                    const Text(
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.web_asset,
                                                          size: 40),
                                                      onPressed: () {
                                                        _launchSocial(
                                                            _trainingCenter
                                                                .website);
                                                      },
                                                    ),
                                                    const Text(
                                                      "Website",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        (_trainingCenter.whatsAppNum != "")
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 45,
                                                      height: 45,
                                                      child: TextButton(
                                                        child: Image.asset(
                                                            "Assets/Icons/whatsapp.png",
                                                            color: (isDark)
                                                                ? Colors.white
                                                                : Colors.black),
                                                        onPressed: () {
                                                          _launchSocial(
                                                              _trainingCenter
                                                                  .whatsApp);
                                                        },
                                                      ),
                                                    ),
                                                    const Text(
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
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                      (isDark) ? Colors.white : Colors.black38),
                            ),
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: _trainingCenter.phoneNumber));
                              Fluttertoast.showToast(
                                  msg: "Email copyed to clipboard",
                                  backgroundColor: const Color(0xff999999),
                                  gravity: ToastGravity.BOTTOM);
                            },
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? this is for the phone number
                        //?this is for the email
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                    color: (isDark)
                                        ? Colors.white
                                        : Colors.black38),
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
                                _launchSocial(
                                    "tel:${_trainingCenter.phoneNumber}");
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
                            style: const TextStyle(
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
          ]));
        } else {
          return Container(
              width: double.infinity,
              height: 250,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    ));
  }

  Future<TrainingCenter> getTCData(String id) async {
    var url = "showTrainingCenterData";
    TrainingCenter _trainingCenter = TrainingCenter(
      branch: null,
      close: const TimeOfDay(hour: 0, minute: 0),
      description: """""",
      email: "",
      id: "0",
      location: locations[1],
      name: "",
      open: const TimeOfDay(hour: 0, minute: 0),
      phoneNumber: "",
      rating: 0.0,
      tags: [],
      image: "",
      logo: "",
    );
    Map<String, dynamic> trainingCenter = {"id": id};

    try {
      var response = await dioTestApi.post(url, data: trainingCenter);
      if (response.statusCode == 200) {
        _trainingCenter = TrainingCenter.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return _trainingCenter;
  }
  // TrainingCenter? getTCData(String name) {
  //   for (int i = 0; i < trainingCenterData.length; i++) {
  //     if (name == trainingCenterData[i].name) {
  //       return trainingCenterData[i];
  //     }
  //   }
  //   return null;
  // }

  void _launchSocial(String _url) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)

    if (!await launchUrl(Uri.parse(_url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
    // await launchUrl(Uri.https(url),mode: LaunchMode.externalApplication ,);
  }
}
