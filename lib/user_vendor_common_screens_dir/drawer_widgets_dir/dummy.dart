import 'package:flutter/material.dart';
import 'package:salam_flutter/fourm_dir/fourm_screen.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../student_dir/student_profile_screen.dart';
import '../../teacher_dir/teacher_profile_screen.dart';
import '../account_dir/account_screen.dart';
import '../chat_dir/GroupChatScreen.dart';
import '../chat_dir/chat_list.dart';
import '../course_view_dir/course_view_screen.dart';
import '../home_screen_dir/ststic_model_for_home_courses.dart';
import '../notification_dir/notification_screen.dart';

class DummyList extends StatelessWidget {
  const DummyList({Key? key}) : super(key: key);

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
            "Test Screen",
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
                  builder: (context) => StudentProfileScreen()));
            },
            child: const Text(
              "StudentProfileScreen",
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
                  builder: (context) => TeacherProfileScreen()));
            },
            child: const Text(
              "TeacherProfileScreen",
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
                  builder: (context) =>
                      NotificationListScreen(courseListOfModels)));
            },
            child: const Text(
              "NotificationListScreen",
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
                  builder: (context) => ChatListScreen(courseListOfModels)));
            },
            child: const Text(
              "ChatListScreen",
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
                  builder: (context) => CourseViewScreen("na")));
            },
            child: const Text(
              "CourseViewScreen",
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AccountScreen()));
            },
            child: const Text(
              "AccountScreen",
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
                  builder: (context) => ForumsStudentScreen()));
            },
            child: const Text(
              "Student Fourm",
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GroupChatScreen()));
            },
            child: const Text(
              "GroupChatScreen",
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
