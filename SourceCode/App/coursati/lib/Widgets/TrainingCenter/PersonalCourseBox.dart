import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Classes/GlobalVariables.dart';
import 'package:coursati/Classes/Trainer.dart';
import 'package:coursati/Widgets/TrainingCenter/CourseDetailed/CourseDetailedfetchData.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Services/ScreenController.dart';
import 'BoxCourseLabelPersonal.dart';
import 'CourseDetailed/CourseDetailedInfo.dart';

class PersonalCourseBox extends StatefulWidget {
  const PersonalCourseBox({super.key, required this.bld});

  final BoxCourseLabelData bld;

  @override
  State<PersonalCourseBox> createState() => _PersonalCourseBoxState();
}

class _PersonalCourseBoxState extends State<PersonalCourseBox>
    with TickerProviderStateMixin {
  late AnimationController _boxAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _boxAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.03,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return ScaleTransition(
        scale: _boxAnimationController,
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 20),
          width: (MediaQuery.of(context).size.width / 2.3),
          height: (MediaQuery.of(context).size.height / 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            elevation: 5,
            shadowColor: (isDark) ? const Color(0xff1776e0) : Colors.grey,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff000000),
                    Color(0x22444444),
                    Color(0x00000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: null,
                splashFactory: InkSplash.splashFactory,
                onTap: _onTap,
                splashColor: const Color(0xff1776e0),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress),
                  ),
                  imageUrl: widget.bld.image!,
                  imageBuilder: (context, imageProvider) => Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0x44000000)),
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    widget.bld.courseID.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            )),
                        Spacer(),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            BoxCourseLabelPersonal(bld: widget.bld),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  void _onTap() async {
    _boxAnimationController.forward().then((value) => {
          _boxAnimationController.reverse(),
        });

    await getAllTrainers(id: widget.bld.id).then((value) {
      Navigator.of(context).push(ScreenController().createRoute(
        CourseDetailedfetchData(id: widget.bld.id!, trainers: value),
        1,
      ));
    });

    /////////////////////////////////////////////////////////////////////
    ///
    ///
    ///
    //Write Your code here

    ///
    ///
    ///
    ////////////////////////////////////////////////////////////////////
  }

  Future<List<BLDTrainer>> getAllTrainers({required id}) async {
    var url = "CourseInfo";
    try {
      List<dynamic> list;
      List<BLDTrainer> trainers = [];
      var response = await dioTestApi.post(url, data: {"id": id});
      if (response.statusCode == 200) {
        list = response.data['info'];
        list.forEach((element) {
          trainers.add(BLDTrainer.fromJson(element));
        });

        return trainers;
      }
    } catch (ex) {}
    return [];
  }
}
