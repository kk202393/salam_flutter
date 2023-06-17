import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';

class ChatListScreen extends StatefulWidget {
  final slideList;

  ChatListScreen(this.slideList);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(
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
                      "Messages",
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

            Expanded(child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                itemCount: 17,
                reverse: false,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 30,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    ConstantVariable.homeItemsLeftRightMargin_2,
                                    0,
                                    ConstantVariable.homeItemsLeftRightMargin_2,
                                    ConstantVariable.homeBottomMargin),
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/images/user_image.png'),
                                  maxRadius: 30,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 55,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Pooja Aggarwal",
                                        maxLines: 2,
                                        style:
                                        TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 18),
                                      ),
                                    ),
                                    Text(
                                      "Graphic Designer Graphic Designer Graphic Designer Graphic Designer",
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: MyColors.textColorOnProfile_Grey, fontSize: 15),
                                    ),

                                  ],
                                ),

                              ),
                            ),


                          ],
                        ),



                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: Container(color: MyColors.textColorOnProfile_Blue),
                          ),
                        ),
                      ],
                    ),
                  );
                })),


          ])),
    );
  }
}