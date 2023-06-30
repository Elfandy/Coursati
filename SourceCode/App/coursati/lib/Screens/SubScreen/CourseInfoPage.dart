import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursati/Screens/SubScreen/MapScreenTC.dart';
import 'package:coursati/Screens/SubScreen/TrainingCenterInfoPage.dart';
import 'package:coursati/Screens/SubScreen/mapScreenCourse.dart';
import 'package:coursati/Services/ScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Classes/Course.dart';
import '../../Classes/GlobalVariables.dart';
import '../../Classes/TagData.dart';
import '../../Classes/Trainer.dart';
import '../../Widgets/CustomeWidgets/TagChip.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage({super.key, required this.id});
  final String id;

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  final TextStyle _labeleStyle = TextStyle(
      color: const Color(0xff1776e0), fontSize: (languageType == 0) ? 22 : 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getCourseData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Course _course = snapshot.data!;
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
                  imageUrl: _course.image,
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
              scrollDirection: Axis.vertical,
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
                        color:
                            (isDark) ? const Color(0xff424242) : Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is the title and icon of the course
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: TextButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: _course.name));
                                  Fluttertoast.showToast(
                                      msg:
                                          "${_course.name} copyed to clipboard",
                                      backgroundColor: const Color(0xff999999),
                                      gravity: ToastGravity.BOTTOM);
                                },
                                style: TextButton.styleFrom(
                                    fixedSize: Size(
                                        (MediaQuery.of(context).size.width /
                                            1.7),
                                        100)),
                                child: Text(
                                  (" ${_course.name}"),
                                  style: const TextStyle(
                                      fontSize: 20, color: Color(0xff1776e0)),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: (isDark) ? Colors.white70 : null,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        _course.icon),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is the side where simple data is in
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(ScreenController()
                                  .createRoute(
                                      TrainingCenterPage(
                                          id: _course.trainingCenterID),
                                      1));
                            },
                            child: Text(
                              (languageType == 0)
                                  ? "مركز ${_course.trainingCenterName}"
                                  : "${_course.trainingCenterName} Center",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${_course.startingDate.day}/${_course.startingDate.month}/${_course.startingDate.year}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_rounded,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${_course.duration} ${(languageType == 0) ? "ساعة" : "hours"}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    size: 30,
                                  ),
                                  Text(
                                    "${_course.price}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is the side of the Location and Training Center Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(ScreenController().createRoute(
                                      MapScreenCourse(
                                        course: _course,
                                        onTap: () {
                                          Navigator.of(context).push(
                                              ScreenController().createRoute(
                                                  MapScreenCourse(
                                                      course: _course,
                                                      onTap: () {}),
                                                  0));
                                        },
                                      ),
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
                                  _course.location.city!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1776e0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is the side of the tags section

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Text(
                                (languageType == 0) ? "الوسوم" : "Tags",
                                style: _labeleStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  for (Tag i in _course.tags)
                                    TagChip(
                                      passiveBackgroundColor: (isDark)
                                          ? const Color.fromARGB(
                                              183, 250, 250, 250)
                                          : const Color.fromRGBO(
                                              200, 200, 200, 0.5),
                                      selected: [],
                                      tag: i,
                                      selectable: false,
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is the side of the about the course section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            (languageType == 0)
                                ? "معلومات عن الدورة"
                                : "About the course",
                            style: _labeleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Text(
                            _course.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                        //? This is the side of the instructor info
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            (languageType == 0) ? "المدرب" : "Instructor",
                            style: const TextStyle(
                                fontSize: 28, color: Color(0xff1776e0)),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //?This is the side of instructor image
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  child: CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                        _course.trainerData.image),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                //!!!!!!!!!!!!!!!!!!!!!!
                                //? This is the side of data
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      _course.trainerData.name,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Row(
                                      children: [
                                        Text((languageType == 0)
                                            ? "التخصص:"
                                            : "Major:"),
                                        Text(
                                          _course.trainerData.major,
                                          style: const TextStyle(
                                              color: Color(0xff1776e0)),
                                        ),
                                      ],
                                    ),
                                    //? this is the rating bar
                                    // RatingBar(
                                    //     initialRating: _course.trainerData.rating,
                                    //     direction: Axis.horizontal,
                                    //     allowHalfRating: true,
                                    //     itemCount: 5,
                                    //     itemSize: 30,
                                    //     ratingWidget: RatingWidget(
                                    //       full: const Icon(
                                    //         Icons.star,
                                    //         color: Colors.amber,
                                    //       ),
                                    //       half: (languageType == 0)
                                    //           ? Transform.scale(
                                    //               scaleX: -1,
                                    //               child: const Icon(
                                    //                 Icons.star_half,
                                    //                 color: Colors.amber,
                                    //               ),
                                    //             )
                                    //           : const Icon(
                                    //               Icons.star_half,
                                    //               color: Colors.amber,
                                    //             ),
                                    //       empty: const Icon(
                                    //         Icons.star_border_outlined,
                                    //         color: Colors.amber,
                                    //       ),
                                    //     ),
                                    //     onRatingUpdate: (value) {})
                                  ],
                                ),
                              ],
                            )),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                        //? This is the side of the About the instructor
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            (languageType == 0)
                                ? "معلومات عن المدرب"
                                : "About the Instructor",
                            style: _labeleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Text(
                            _course.trainerData.discription,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        //? This is for the legal
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
                      ],
                    ),
                  ),
                ],
              ),
            )
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

  Future<Course> getCourseData(String id) async {
    var url = "CourseInfo";

    Course _course = Course(
      name: "",
      trainingCenterID: "0",
      image: "",
      id: '',
      active: 0,
      description: """""",
      discount: 0,
      duration: 0,
      full: false,
      price: 0.0,
      startingDate: DateTime(2023),
      tags: [],
      trainer: "0",
      icon: "",
      location: locations[0],
      repeats: false,
      trainerData: Trainer(
        id: "0",
        discription: """""",
        image: "",
        major: "",
        name: "",
      ),
    );

    try {
      print(id);
      var response = await dioTestApi.post(url, data: {"id": int.parse(id)});
      if (response.statusCode == 200) {
        _course = Course.fromJson(response.data['info'][0]);
        print(response.data);
      }
    } catch (e) {
      print(e);
    }

    return _course;
  }
}
