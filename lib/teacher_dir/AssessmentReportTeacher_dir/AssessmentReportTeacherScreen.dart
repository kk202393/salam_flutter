import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../UpcomingClasses_Dir/UpcomingClassesList.dart';
import '../UpcomingClasses_Dir/static_model_upcoming_classes.dart';

class AssessmentReportTeacherScreen extends StatefulWidget {
  const AssessmentReportTeacherScreen({Key? key}) : super(key: key);

  @override
  State<AssessmentReportTeacherScreen> createState() => _AssessmentReportTeacherScreenState();
}

class _AssessmentReportTeacherScreenState extends State<AssessmentReportTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: double.infinity,
              color: MyColors.homeBottomMenuBgcolor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Assessment report',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),


            Expanded(
                child: Container(
                  color: MyColors.grey,
                  child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  reverse: false,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            color: MyColors.white,
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "Flutter",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: MyColors.textColorOnProfile_Black, fontSize: 15),
                                      ),
                                      Text(
                                        "Submit Assessment:19 May 2022",
                                        style:
                                        TextStyle(color: MyColors.activatedGrey, fontSize: 12),
                                      ),
                                    ],
                                  ),

                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,5,5,5),
                                      child: Image(
                                        image: new AssetImage("assets/images/eye_blue.png"),
                                        width: 22,
                                        height: 22,
                                        color: null,
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5,5,10,5),
                                      child: Image(
                                        image: new AssetImage("assets/images/check_green.png"),
                                        width: 20,
                                        height: 20,
                                        color: null,
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )),

          ]),
        ));
  }
}
