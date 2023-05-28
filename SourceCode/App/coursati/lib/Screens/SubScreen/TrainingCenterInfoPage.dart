import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Screens/SubScreen/MapScreen.dart';
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

    TextStyle tagsStyle = TextStyle(
            color: const Color(0xff1776e0),
            fontSize: (languageType == 0) ? 16 : 16),
        branchStyle = const TextStyle(fontSize: 16),
        labeleStyle = TextStyle(
            color: const Color(0xff1776e0),
            fontSize: (languageType == 0) ? 22 : 20);
    EdgeInsets labelPad = const EdgeInsets.fromLTRB(20, 10, 20, 10);

    //??????????????????????????????????????????????????????????????????????????????????

    //************************************************************************* */

    return Scaffold(
        body: FutureBuilder(
      future: getTCData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          TrainingCenter trainingCenter = snapshot.data!;
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
                  imageUrl: trainingCenter.image,
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
                                        text: trainingCenter.name));
                                    Fluttertoast.showToast(
                                        msg:
                                            "${trainingCenter.name} copyed to clipboard",
                                        backgroundColor:
                                            const Color(0xff999999),
                                        gravity: ToastGravity.BOTTOM);
                                  },
                                  child: Text(
                                    ((languageType == 0)
                                        ? "مركز ${trainingCenter.name}"
                                        : "${trainingCenter.name} Center"),
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
                                      trainingCenter.logo,
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
                                    ? " ${trainingCenter.open.hour}:${(trainingCenter.open.minute.toInt() < 10) ? "0${trainingCenter.open.minute}" : trainingCenter.open.minute.toString()} - ${trainingCenter.close.hour}:${(trainingCenter.close.minute.toInt() < 10) ? "0${trainingCenter.close.minute}" : trainingCenter.close.minute.toString()}"
                                    : " ${trainingCenter.open.hour}:${(trainingCenter.open.minute.toInt() < 10) ? "0${trainingCenter.open.minute}" : trainingCenter.open.minute.toString()} - ${trainingCenter.close.hour}:${(trainingCenter.close.minute.toInt() < 10) ? "0${trainingCenter.close.minute}" : trainingCenter.close.minute.toString()}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? this is the location of the main branch of the center
                        Padding(
                          padding: labelPad,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(ScreenController()
                                  .createRoute(
                                      MapScreen(loc: trainingCenter.location),
                                      1));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset(
                                    "Assets/Icons/map-pin-location.png",
                                    color:
                                        (isDark) ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (languageType == 0)
                                      ? "العنوان: "
                                      : "Address: ",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  trainingCenter.location.city!,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //?This is the branches place of the center
                        // (trainingCenter.branch!.isNotEmpty)
                        //     ? Padding(
                        //         padding: labelPad,
                        //         child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 (languageType == 0)
                        //                     ? "الفروع"
                        //                     : "Branches",
                        //                 style: labeleStyle,
                        //               ),

                        //               // Wrap(
                        //               //   spacing: 10,
                        //               //   runSpacing: 10,
                        //               //   children: [
                        //               //     for (int i = 0;
                        //               //         i <
                        //               //             trainingCenter
                        //               //                 .branch!.length;
                        //               //         i++)
                        //               //       Row(
                        //               //           mainAxisAlignment:
                        //               //               MainAxisAlignment.start,
                        //               //           children: [
                        //               //             Container(
                        //               //               width: 25,
                        //               //               height: 25,
                        //               //               child: Image.asset(
                        //               //                 "Assets/Icons/map-pin-location.png",
                        //               //                 color: (isDark)
                        //               //                     ? Colors.white
                        //               //                     : Colors.black,
                        //               //               ),
                        //               //             ),
                        //               //             const SizedBox(
                        //               //               width: 10,
                        //               //             ),
                        //               //             // Text(
                        //               //             //   trainingCenter.branch![i]
                        //               //             //       .location.city!,
                        //               //             //   style: branchStyle,
                        //               //             // ),
                        //               //           ]),
                        //               //   ],
                        //               // ),

                        //               //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //               //? this is the tags place of the center
                        //             ]))
                            // : Container(),
                        //* Second try of the tags place

                        (trainingCenter.tags.isNotEmpty)
                            ? Padding(
                                padding: labelPad,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        (languageType == 0) ? "الوسوم" : "Tags",
                                        style: labeleStyle,
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        for (int i = 0;
                                            i < trainingCenter.tags.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xffdddddd)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  (languageType == 0)
                                                      ? trainingCenter
                                                          .tags[i].name_ar!
                                                      : trainingCenter
                                                          .tags[i].name_en!,
                                                  style: tagsStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        // Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child:

                        //     )),

                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!a
                        //? this is the description

                        Padding(
                          padding: labelPad,
                          child: Text(
                            (languageType == 0) ? "الوصف" : "Description",
                            style: labeleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Text(
                            trainingCenter.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //?this is the see our courses section
                        Padding(
                          padding: labelPad,
                          child: const Divider(),
                        ),
                        TextButton(
                          child: Padding(
                            padding: labelPad,
                            child: Text(
                              (languageType == 0)
                                  ? "تفحص دوراتنا"
                                  : "See Our Courses",
                              style: labeleStyle,
                            ),
                          ),
                          //???????????????? This is for the function of the see our courses
                          onPressed: () {
                            Navigator.of(context).push(ScreenController()
                                .createRoute(const CoursesViewPage(), 1));
                          },
                        ),
                        Padding(
                          padding: labelPad,
                          child: const Divider(),
                        ),

                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is for the contact us section
                        (trainingCenter.facebook != "" ||
                                trainingCenter.website != "" ||
                                trainingCenter.viperAllow ||
                                trainingCenter.whatsAppNum != "")
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: labelPad,
                                    child: Text(
                                      (languageType == 0)
                                          ? "تواصل معنا"
                                          : "Contact Us",
                                      style: labeleStyle,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        (trainingCenter.facebook != "")
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
                                                            trainingCenter
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
                                        (trainingCenter.website != "")
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
                                                            trainingCenter
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
                                        (trainingCenter.whatsAppNum != "")
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
                                                              trainingCenter
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
                            style: labeleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextButton(
                            child: Text(
                              trainingCenter.email,
                              style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      (isDark) ? Colors.white : Colors.black38),
                            ),
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: trainingCenter.phoneNumber));
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
                            style: labeleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextButton(
                              child: Text(
                                trainingCenter.phoneNumber,
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
                                    "tel:${trainingCenter.phoneNumber}");
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
    TrainingCenter trainingCenter0 = TrainingCenter(
      // branch: null,
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
        trainingCenter0 = TrainingCenter.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return trainingCenter0;
  }
  // TrainingCenter? getTCData(String name) {
  //   for (int i = 0; i < trainingCenterData.length; i++) {
  //     if (name == trainingCenterData[i].name) {
  //       return trainingCenterData[i];
  //     }
  //   }
  //   return null;
  // }

  void _launchSocial(String url) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)

    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
    // await launchUrl(Uri.https(url),mode: LaunchMode.externalApplication ,);
  }
}
