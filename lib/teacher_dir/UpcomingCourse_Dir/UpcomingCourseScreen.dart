import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:salam_flutter/teacher_dir/UpcomingCourse_Dir/paid_course_list.dart';
import 'package:salam_flutter/teacher_dir/UpcomingCourse_Dir/upcomingCourseModel.dart';

import '../../constants/colors_dir/Colors.dart';

class UpcomingCourseScreen extends StatefulWidget {
  const UpcomingCourseScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingCourseScreen> createState() => _UpcomingCourseScreenState();
}

class _UpcomingCourseScreenState extends State<UpcomingCourseScreen> {
  final searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              color: MyColors.homeBottomMenuBgcolor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Upcoming Course',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(

                child: Stack(children: [
                  TextField(
                    controller: searchController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 22,
                    color: MyColors.homeBottomMenuBgcolor),
              ),
            ),

            // HomeCategoriesList(staticListofCategoriseAtHome),
            //
            // HomeCategoriesList(staticListofCategoriseAtHome_2),

            Expanded(child: PaidCourseList(upcomingcourselistmodel))
          ]),
        ));
  }
}
