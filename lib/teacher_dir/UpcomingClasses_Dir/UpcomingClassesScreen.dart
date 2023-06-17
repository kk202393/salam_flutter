import 'package:flutter/material.dart';
import 'package:salam_flutter/constants/colors_dir/Colors.dart';
import 'package:salam_flutter/teacher_dir/UpcomingClasses_Dir/static_model_upcoming_classes.dart';

import '../../constants/constant_variable/constant_variable.dart';
import 'UpcomingClassesList.dart';

class UpcomingClassesScreen extends StatefulWidget {
  const UpcomingClassesScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingClassesScreen> createState() => _UpcomingClassesScreenState();
}

class _UpcomingClassesScreenState extends State<UpcomingClassesScreen> {
  final searchController = TextEditingController();


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
                    'Upcoming Classes',
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
            Text(
              'Graphic Designing Upcoming Class',
              style: TextStyle(
                  fontSize: 22,
                  color: MyColors.homeBottomMenuBgcolor),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: UpcomingClassesList(teams),
            )),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        0,
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        ConstantVariable.homeBottomMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.facebookButtonColor,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(0.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Edit Upcoming Class",
                        style:
                        TextStyle(color: MyColors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        0,
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        ConstantVariable.homeBottomMargin),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.facebookButtonColor,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(0.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Back",
                        style:
                        TextStyle(color: MyColors.white, fontSize: 15),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ]),
        ));
  }
}
