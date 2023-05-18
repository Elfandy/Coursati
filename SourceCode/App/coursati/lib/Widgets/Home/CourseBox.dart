import 'package:coursati/Classes/BoxCourseLabelData.dart';
import 'package:coursati/Screens/SubScreen/CourseInfoPage.dart';
import 'package:coursati/Widgets/Home/BoxCourseLabel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Classes/GlobalVariables.dart';
import '../../Screens/SubScreen/TrainingCenterInfoPage.dart';
import '../../Services/ScreenController.dart';

class CourseBox extends StatefulWidget {
  const CourseBox({super.key, required this.bld});

  final BoxCourseLabelData bld;

  @override
  State<CourseBox> createState() => _CourseBoxState();
}

class _CourseBoxState extends State<CourseBox> with TickerProviderStateMixin {
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
          height: (MediaQuery.of(context).size.height / 3.6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            elevation: 5,
            shadowColor:Color(0xff1776e0),
                
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
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            BoxCourseLabel(bld: widget.bld),
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
    Navigator.of(context).push(ScreenController().createRoute(
      CourseInfoPage(name: widget.bld.name!),
      2,
    ));

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
}
