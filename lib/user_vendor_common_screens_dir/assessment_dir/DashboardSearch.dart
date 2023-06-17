import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';

class StudentSingleChatCommonList extends StatelessWidget {
  final slideList;

   StudentSingleChatCommonList(this.slideList);

  bool showCheckBoxValue = false;


  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.screen_color,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              color: MyColors.homeBottomMenuBgcolor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Assessment',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.homeBottomMenuBgcolor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Assignment#1- Nonverbal",
                                style: TextStyle(
                                    color: MyColors.textColorOnProfile_Black,
                                    fontSize: 18),
                              ),
                              Text(
                                "Communication",
                                style: TextStyle(
                                    color: MyColors.textColorOnProfile_Black,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Image(
                            image: new AssetImage("assets/images/check_green.png"),
                            width: 30,
                            height: 30,
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ATTEMPTS",
                                style: TextStyle(
                                    color: MyColors.textColorOnProfile_Blue,
                                    fontSize: 18),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "2",
                                      style: TextStyle(
                                          color: MyColors.greenActive,
                                          fontSize: 22)),
                                  TextSpan(
                                      text: "/3",
                                      style: TextStyle(
                                          color: MyColors.black, fontSize: 22)),
                                ]),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "SCORE",
                                style: TextStyle(
                                    color: MyColors.textColorOnProfile_Blue,
                                    fontSize: 18),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "-",
                                      style: TextStyle(
                                          color: MyColors.greenActive,
                                          fontSize: 22)),
                                  TextSpan(
                                      text: "/36",
                                      style: TextStyle(
                                          color: MyColors.black, fontSize: 22)),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: MyColors.homeBottomMenuBgcolor,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available Date",
                                    style: TextStyle(
                                        color: MyColors.white, fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "11 may 2022, 2:30 pm",
                                      style: TextStyle(
                                          color: MyColors.white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                height: 80,
                                child: VerticalDivider(color: Colors.white)),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available Date",
                                    style: TextStyle(
                                        color: MyColors.white, fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "11 aug 2022, 2:30 pm",
                                      style: TextStyle(
                                          color: MyColors.white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: MyColors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: MyColors.textColorOnProfile_Blue,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Instructions',
                              style: TextStyle(color: MyColors.white, fontSize: 18),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: null,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Discussions',
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Blue,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: null,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Attempts',
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Blue,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam tation ullamcorper suscipit lobortis nisl ut aliquip ex eaerat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci",
                style: TextStyle(
                    height: 1.4,
                    color: MyColors.textColorOnProfile_Black,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Quiz-1",
                style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: MyColors.textColorOnProfile_Blue),
              ),
            ),

          ]),
        ));
  }
}
