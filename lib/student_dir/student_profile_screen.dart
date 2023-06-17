import 'package:flutter/material.dart';

import '../constants/colors_dir/Colors.dart';
import '../constants/constant_variable/constant_variable.dart';
import '../constants/constant_widgets_dir/CustomWidget.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            ConstantVariable.homeItemsLeftRightMargin_2,
                            0,
                            ConstantVariable.homeItemsLeftRightMargin_2,
                            ConstantVariable.homeBottomMargin),
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: ConstantMethods.imageIcon("assets/images/arrow.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0,
                            0,
                            ConstantVariable.homeItemsLeftRightMargin_2,
                            ConstantVariable.homeBottomMargin),
                        child: TextButton(
                          child: const Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 15,
                                color: MyColors.textColorOnProfile_Black),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/user_image.png'),
                          maxRadius: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sunil Dutta",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 22),
                        ),
                      ),
                      Text(
                        "sunildutta1234@gmail.com",
                        style: TextStyle(
                            color: MyColors.textColorOnProfile_Blue,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Video Preferences",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "Download options",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Video playback options",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Account settings",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "Account security",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Email notification preferences",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                              child: Text(
                                "Learning reminders",
                                style: TextStyle(
                                    color: MyColors.textColorOnProfile_Blue,
                                    fontSize: 20),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: MyColors.facebookButtonColor,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "New",
                                style:
                                TextStyle(color: MyColors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Other settings",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "About us",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "About our business",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Asked questions",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Share the app",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Diagnostics",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "Status",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 35),
                          child: Center(
                            child: InkWell(
                                onTap: (){
                                  ConstantMethods.setLoggedOut(context);
                                },
                                child: Text(
                              "Logout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Blue,
                                  fontSize: 20),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
      ),
    ));
  }
}