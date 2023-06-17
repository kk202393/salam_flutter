import 'package:flutter/material.dart';

import '../constants/colors_dir/Colors.dart';
import '../constants/constant_variable/constant_variable.dart';
import '../constants/constant_widgets_dir/CustomWidget.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Container(
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
                            "Teacher Profile",
                            style: TextStyle(fontSize: 15, color: MyColors.textColorOnProfile_Black),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            ConstantVariable.homeItemsLeftRightMargin_2,
                            0,
                            ConstantVariable.homeItemsLeftRightMargin_2,
                            ConstantVariable.homeBottomMargin),
                        child: CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/user_image.png'),
                          maxRadius: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pooja Aggarwal",
                                maxLines: 2,
                                style:
                                TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 22),
                              ),
                            ),
                            Text(
                              "Graphic Designer",
                              maxLines: 1,
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Grey, fontSize: 15),
                            ),
                            Text(
                              "ID:12345678",
                              maxLines: 1,
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Grey, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABOUT",
                          maxLines: 2,
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "I am reliable conscientious and dedicated. I am open minded and tolerant of all customs, values and traditions. I am patient and polite and do not mind working through things in a caring encouraging way with students. I strive to be prompt and efficient in my teaching methods.",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue, fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: Container(color: MyColors.textColorOnProfile_Blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Information",
                            maxLines: 2,
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Blue, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Delhi xyz nagar, India",
                            style: TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Faculty",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "Seni Dan Desian",
                            style: TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "salamflutter123@gmail.com",
                            style: TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Phone",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "+91- 1234567890",
                            style: TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                          child: Text(
                            "Available",
                            style: TextStyle(
                                color: MyColors.textColorOnProfile_Grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 10, 5),
                          child: Text(
                            "10:00 AM to 7 PM",
                            style: TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                          ),
                        ),

                      ],
                    ),
                  ),
                ])),
      )),
    );
  }
}

