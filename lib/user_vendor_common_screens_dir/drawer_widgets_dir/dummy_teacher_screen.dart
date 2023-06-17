import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../teacher_dir/AssessmentReportTeacher_dir/AssessmentReportTeacherScreen.dart';
import '../../teacher_dir/UpcomingClasses_Dir/UpcomingClassesScreen.dart';
import '../../teacher_dir/UpcomingCourse_Dir/UpcomingCourseScreen.dart';

class DummyTeacherScreen extends StatelessWidget {
  const DummyTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          2, 0, 5, ConstantVariable.drawerBottomMargin),
      child: ExpansionTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: MyColors.white,
              side: BorderSide(
                width: ConstantVariable.drawerItemBorderWidth,
                color: MyColors.facebookButtonColor,
              )),
          onPressed: () {},
          child: const Text(
            "Test Screen Teacher",
            style: TextStyle(
                color: MyColors.facebookButtonColor,
                fontSize: ConstantVariable.drawerItemTvSize),
          ),
        ),
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpcomingClassesScreen()
              ));
            },
            child: const Text(
              "UpcomingClasses",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AssessmentReportTeacherScreen()
              ));
            },
            child: const Text(
              "AssessmentReportScreen",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpcomingCourseScreen()
              ));
            },
            child: const Text(
              "Upcoming Course Screen",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
        ],
      ),
    );
  }
}
