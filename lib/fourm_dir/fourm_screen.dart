import 'package:flutter/material.dart';

import '../constants/colors_dir/Colors.dart';
import '../constants/constant_variable/constant_variable.dart';
import '../constants/constant_widgets_dir/CustomWidget.dart';

class ForumsStudentScreen extends StatefulWidget {
  const ForumsStudentScreen({Key? key}) : super(key: key);

  @override
  State<ForumsStudentScreen> createState() => _ForumsStudentScreenState();
}

class _ForumsStudentScreenState extends State<ForumsStudentScreen> {
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
                'Fourm',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: 7,
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Q.",
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Black,
                                  fontSize: 18),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Lorem ipsum is a simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book?  ',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " ",
                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Black,
                                  fontSize: 18),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Image(
                                                  image: new AssetImage(
                                                      "assets/images/answer.png"),
                                                  width: ConstantVariable
                                                      .fourmPageSmallImageSize,
                                                  height: ConstantVariable
                                                      .fourmPageSmallImageSize,
                                                  color: null,
                                                  fit: BoxFit.scaleDown,
                                                  alignment: Alignment.center,
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 5),
                                                  child: Text(
                                                    'Answer',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: MyColors
                                                            .homeBottomMenuBgcolor),
                                                  ),
                                                ),
                                              ]),
                                          onTap: () {
                                            ConstantMethods.showSnackBar(
                                                context, "answer click");
                                          },
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 15),
                                            child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Image(
                                                    image: new AssetImage(
                                                        "assets/images/eye_blue.png"),
                                                    width: ConstantVariable
                                                        .fourmPageSmallImageSize,
                                                    height: ConstantVariable
                                                        .fourmPageSmallImageSize,
                                                    color: null,
                                                    fit: BoxFit.scaleDown,
                                                    alignment: Alignment.center,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 0, 0, 0),
                                                    child: Text(
                                                      'View',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: MyColors
                                                              .homeBottomMenuBgcolor),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          onTap: () {
                                            ConstantMethods.showSnackBar(
                                                context, "view click");
                                          },
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 15),
                                            child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Image(
                                                    image: new AssetImage(
                                                        "assets/images/reply_blue.png"),
                                                    width: ConstantVariable
                                                        .fourmPageSmallImageSize,
                                                    height: ConstantVariable
                                                        .fourmPageSmallImageSize,
                                                    color: null,
                                                    fit: BoxFit.scaleDown,
                                                    alignment: Alignment.center,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 0, 0, 0),
                                                    child: Text(
                                                      'Reply',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: MyColors
                                                              .homeBottomMenuBgcolor),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          onTap: () {
                                            ConstantMethods.showSnackBar(
                                                context, "reply click");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: new AssetImage(
                                                  "assets/images/question_and_answer.png"),
                                              width: ConstantVariable
                                                  .fourmPageSmallImageSize,
                                              height: ConstantVariable
                                                  .fourmPageSmallImageSize,
                                              color: Colors.black,
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.center,
                                            ),
                                          ]),
                                    ),
                                    onTap: () {
                                      ConstantMethods.showSnackBar(
                                          context, "question answer click");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })),
      ]),
    ));
  }
}
