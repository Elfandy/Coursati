import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/TCBranch.dart';
import 'package:coursati/Classes/TrainingCenter.dart';
import 'package:coursati/Screens/SubScreen/CoursesViewPage.dart';
import 'package:coursati/Screens/SubScreen/MapScreenTC.dart';
import 'package:coursati/Screens/SubScreen/TrainingCenterInfo/TrainingCenterInfoPage.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainingCenterInfo extends StatefulWidget {
  TrainingCenterInfo(
      {super.key,
      required this.branchedto,
      required this.branches,
      required this.canRate,
      required this.following,
      required this.trainingCenter,
      required this.loc,
      required this.TcMine,
      required this.rateCount});
  TrainingCenter trainingCenter;
  int following, canRate, branchedto, rateCount;
  List<TcBranch> branches = [];
  bool loc;
  int TcMine;

  @override
  State<TrainingCenterInfo> createState() => _TrainingCenterInfoState();
}

class _TrainingCenterInfoState extends State<TrainingCenterInfo> {
  TextStyle tagsStyle = TextStyle(
          color: const Color(0xff1776e0),
          fontSize: (languageType == 0) ? 16 : 16),
      branchStyle = const TextStyle(fontSize: 16),
      labeleStyle = TextStyle(
          color: const Color(0xff1776e0),
          fontSize: (languageType == 0) ? 22 : 20);
  EdgeInsets labelPad = const EdgeInsets.fromLTRB(20, 10, 20, 10);

  int following = 0, canRate = 0, branchedto = 0;
  List<TcBranch> branches = [];
  double rating = 0.0;
  bool hasRatied = false;
  @override
  void initState() {
    // TODO: implement initState
    following = widget.following;
    canRate = widget.canRate;
    branchedto = widget.branchedto;
    branches = widget.branches;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TrainingCenter trainingCenter = widget.trainingCenter;

    return SafeArea(
        child: Stack(children: [
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      //? This is the image code
      SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CachedNetworkImage(
            imageUrl: trainingCenter.image,
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width / 2),
                          height: 100,
                          child: TextButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: trainingCenter.name));
                              Fluttertoast.showToast(
                                  msg:
                                      "${trainingCenter.name} copyed to clipboard",
                                  backgroundColor: const Color(0xff999999),
                                  gravity: ToastGravity.BOTTOM);
                            },
                            child: Text(
                              ((languageType == 0)
                                  ? "مركز ${trainingCenter.name}"
                                  : "${trainingCenter.name} Center"),
                              style: const TextStyle(
                                fontSize: 26,
                                color: Color(0xff1776e0),
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              trainingCenter.logo,
                            ),
                            backgroundColor:
                                isDark ? Colors.grey[600] : Colors.white,
                            radius: 40,
                          ),
                          radius: 41,
                          backgroundColor: isDark ? Colors.grey : Colors.black,
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
                              ? " من ${trainingCenter.close.hour}:${(trainingCenter.close.minute.toInt() < 10) ? "0${trainingCenter.close.minute}" : trainingCenter.close.minute.toString()} إلى ${trainingCenter.open.hour}:${(trainingCenter.open.minute.toInt() < 10) ? "0${trainingCenter.open.minute}" : trainingCenter.open.minute.toString()}"
                              : " From ${trainingCenter.open.hour}:${(trainingCenter.open.minute.toInt() < 10) ? "0${trainingCenter.open.minute}" : trainingCenter.open.minute.toString()} To ${trainingCenter.close.hour}:${(trainingCenter.close.minute.toInt() < 10) ? "0${trainingCenter.close.minute}" : trainingCenter.close.minute.toString()}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  //? this is the location of the main branch of the center
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: widget.loc
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(ScreenController().createRoute(
                                        MapScreen(
                                          tc: trainingCenter,
                                          onTap: () {},
                                        ),
                                        1));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
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
                                    (languageType == 0)
                                        ? "العنوان: "
                                        : "Address: ",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      trainingCenter.location.city!,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
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
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    trainingCenter.location.city!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  widget.TcMine == 0
                      ? following != 0
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: double.infinity,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              following == 2 ? 160 : 130, 50),
                                          backgroundColor: following == 2
                                              ? Colors.white
                                              : const Color(0xff1667e0),
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: const BorderSide(
                                                  color: Color(0xff1776e0)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: following == 2
                                                ? const Color(0xff1667e0)
                                                : Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              following == 2
                                                  ? languageType == 0
                                                      ? "إلغاء المتابعة"
                                                      : "Unfollow"
                                                  : languageType == 0
                                                      ? "متابعة"
                                                      : "Follow",
                                              style: TextStyle(
                                                  color: following == 2
                                                      ? const Color(0xff1667e0)
                                                      : Colors.white)),
                                        ],
                                      ),
                                      onPressed: () async {
                                        if (following == 1) {
                                          followTC();
                                        } else if (following == 2) {
                                          unFollowTC();
                                        }
                                      }),
                                ],
                              ),
                            )
                          : Container()
                      : Container(),

                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  //?This is the all courses from tc place of the center

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
                      Navigator.of(context).push(ScreenController().createRoute(
                          CoursesViewPage(
                            id: trainingCenter.id,
                          ),
                          1));
                    },
                  ),

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
                                            color: const Color(0xffdddddd)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            (languageType == 0)
                                                ? trainingCenter.tags[i].name_ar
                                                : trainingCenter
                                                    .tags[i].name_en,
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
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  branches.isNotEmpty
                      ? Padding(
                          padding: labelPad,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (languageType == 0) ? "الفروع" : "Branches",
                                  style: labeleStyle,
                                ),

                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    for (var branch in branches)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
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
                                              TextButton(
                                                child: Text(
                                                  branch.locName,
                                                  style: branchStyle,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      ScreenController()
                                                          .createRoute(
                                                              TrainingCenterPage(
                                                                  id: branch.id
                                                                      .toString(),
                                                                  loc: true),
                                                              1));
                                                },
                                              ),
                                            ]),
                                      ),
                                  ],
                                ),

                                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                //? this is the tags place of the center
                              ]))
                      : Container(),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  //???????????? The rating side
                  Padding(
                    padding: labelPad,
                    child: const Divider(),
                  ),

                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                trainingCenter.rating.toString(),
                                style: const TextStyle(fontSize: 50),
                              ),
                              RatingBar.builder(
                                onRatingUpdate: (value) {},
                                initialRating: trainingCenter.rating,
                                minRating: 1,
                                itemSize: 10,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                ignoreGestures: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xff1776e0),
                                  size: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.rateCount.toString()),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: VerticalDivider(),
                        ),
                        Stack(
                          children: [
                            user.token != ''
                                ? Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: RatingBar.builder(
                                          initialRating: 3,
                                          itemSize: 40,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rate) {
                                            setState(() {
                                              hasRatied = true;
                                              rating = rate;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          canRate == 1
                                              ? OutlinedButton(
                                                  onPressed: () {
                                                    if (hasRatied) {
                                                      submitRate().then(
                                                        (value) {
                                                          setState(() {
                                                            hasRatied = false;
                                                          });
                                                          Navigator.pushReplacement(
                                                              context,
                                                              ScreenController().createRoute(
                                                                  TrainingCenterPage(
                                                                      id: widget
                                                                          .trainingCenter
                                                                          .id,
                                                                      loc: widget
                                                                          .loc),
                                                                  1));
                                                        },
                                                      );
                                                      // Navigator.of(context).pushReplacement(
                                                      //     ScreenController().createRoute(
                                                      //         TrainingCenterPage(
                                                      //             id: widget
                                                      //                 .trainingCenter.id,
                                                      //             loc: widget.loc),
                                                      //         1));
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "please select rating before submitting");
                                                    }
                                                  },
                                                  child: const Text(
                                                      "Submit Rate",
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                  style: OutlinedButton
                                                      .styleFrom(),
                                                )
                                              : OutlinedButton(
                                                  onPressed: () {
                                                    if (hasRatied) {
                                                      updateRate().then(
                                                        (value) {
                                                          setState(() {
                                                            hasRatied = false;
                                                          });
                                                          Navigator.pushReplacement(
                                                              context,
                                                              ScreenController().createRoute(
                                                                  TrainingCenterPage(
                                                                      id: widget
                                                                          .trainingCenter
                                                                          .id,
                                                                      loc: widget
                                                                          .loc),
                                                                  1));
                                                        },
                                                      );

                                                      // Navigator.of(context).pushReplacement(
                                                      //     ScreenController().createRoute(
                                                      //         TrainingCenterPage(
                                                      //             id: widget
                                                      //                 .trainingCenter.id,
                                                      //             loc: widget.loc),
                                                      //         1));
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "please select rating before submitting");
                                                    }
                                                  },
                                                  child: const Text(
                                                      "Update Rate",
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                  style: OutlinedButton
                                                      .styleFrom(),
                                                ),
                                          const SizedBox(width: 10),
                                          OutlinedButton(
                                              onPressed: () {
                                                deleteRating().then((value) {
                                                  setState(() {
                                                    hasRatied = false;
                                                  });
                                                  Navigator.pushReplacement(
                                                      context,
                                                      ScreenController().createRoute(
                                                          TrainingCenterPage(
                                                              id: widget
                                                                  .trainingCenter
                                                                  .id,
                                                              loc: widget.loc),
                                                          1));
                                                });
                                              },
                                              child: const Text("delete Rate",
                                                  style:
                                                      TextStyle(fontSize: 12)))
                                        ],
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Text(languageType == 0
                                          ? "الرجاء تسجيل الدخول لتقييم المركز التدريبي"
                                          : "Please Login First to rate the Training center"),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: labelPad,
                    child: const Divider(),
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  //?this is the see our courses section

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
                                  (trainingCenter.facebook != "" &&
                                          trainingCenter.facebook != null)
                                      ? Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.facebook,
                                                    size: 40),
                                                onPressed: () {
                                                  _launchSocial(trainingCenter
                                                          .facebook!
                                                          .startsWith('https')
                                                      ? trainingCenter.facebook!
                                                      : "https://" +
                                                          trainingCenter
                                                              .facebook!);
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
                                  (trainingCenter.website != null &&
                                          trainingCenter.website != '')
                                      ? Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.web_asset,
                                                    size: 40),
                                                onPressed: () {
                                                  _launchSocial(trainingCenter
                                                          .website!
                                                          .startsWith('http')
                                                      ? trainingCenter.website!
                                                      : "http://" +
                                                          trainingCenter
                                                              .website!);
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
                                  (trainingCenter.whatsAppNum != "" &&
                                          trainingCenter.whatsApp != "")
                                      ? Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: TextButton(
                                                  child: Image.asset(
                                                      "Assets/Icons/whatsapp.png",
                                                      color: (isDark)
                                                          ? Colors.white
                                                          : Colors.black),
                                                  onPressed: () {
                                                    _launchSocial(trainingCenter
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
                  Padding(
                    padding: labelPad,
                    child: const Divider(),
                  ),

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
                            color: (isDark) ? Colors.white : Colors.black38),
                      ),
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: trainingCenter.phoneNumber));
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
                              color: (isDark) ? Colors.white : Colors.black38),
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
                          _launchSocial("tel:${trainingCenter.phoneNumber}");
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
  }

  void _launchSocial(String url) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      if (!await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
    // await launchUrl(Uri.https(url),mode: LaunchMode.externalApplication ,);
  }

  Future followTC() async {
    var url = 'follow';
    try {
      var response = await dioTestApi.post(url,
          data: {'userID': user.id, 'tcID': widget.trainingCenter.id});
      if (response.statusCode == 200) {
        if (response.data == 'ok') {
          setState(() {
            following = 2;
          });
        } else {
          Fluttertoast.showToast(
              msg: languageType == 0
                  ? "حدث خطاء أثناء متابعة مركز التدريب"
                  : "There is a Problem following This Training Center");
        }
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  Future unFollowTC() async {
    var url = 'unfollow';
    try {
      var response = await dioTestApi.post(url,
          data: {'userID': user.id, 'tcID': widget.trainingCenter.id});
      if (response.statusCode == 200) {
        if (response.data == 'ok') {
          setState(() {
            following = 1;
          });
        } else {
          Fluttertoast.showToast(
              msg: languageType == 0
                  ? "حدث خطاء أثناء إلغاء المتابعة من مركز التدريب"
                  : "There is a Problem Unfollowing This Training Center");
        }
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  Future submitRate() async {
    var url = "tc/rate";
    try {
      var response = await dioTestApi.post(url, data: {
        'userID': user.id,
        'tcID': widget.trainingCenter.id,
        "rating": rating
      });
      // print(response.data);
      // print("hello");

      if (response.statusCode == 200) {
        if (response.data == 'added') {
          // Fluttertoast.showToast(msg: "Your rating have been added succefully");
          return true;
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }

  Future updateRate() async {
    var url = "tc/updateRate";
    try {
      var response = await dioTestApi.post(url, data: {
        'userID': user.id,
        'tcID': widget.trainingCenter.id,
        "rating": rating
      });
      if (response.statusCode == 200) {
        if (response.data == 'added') {
          // Fluttertoast.showToast(msg: "Your rating have been added succefully");
          // setState(() {
          //   Navigator.pushReplacement(
          //       context,
          //       ScreenController().createRoute(
          //           TrainingCenterPage(
          //               id: widget.trainingCenter.id, loc: widget.loc),
          //           1));
          // });
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }

  Future deleteRating() async {
    var url = "tc/deleteRate";
    try {
      var response = await dioTestApi.post(url, data: {
        'userID': user.id,
        'tcID': widget.trainingCenter.id,
      });
      if (response.statusCode == 200) {
        if (response.data == 'deleted') {
          // Fluttertoast.showToast(msg: "Your rating have been removed");
          // setState(() {});
        }
      }
    } catch (exception) {
      if (kDebugMode) print(exception);
    }
  }
}
