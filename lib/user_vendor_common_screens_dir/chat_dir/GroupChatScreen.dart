import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import 'ChatModel.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final slideList = chatRes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 5,
                                      ConstantVariable.homeBottomMargin),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: ConstantMethods.imageIcon(
                                      "assets/images/arrow.png")),
                                ),
                                TextButton(
                                  child: const Text(
                                    "Graphic Design Group",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color:
                                        MyColors.textColorOnProfile_Black),
                                  ),
                                  onPressed: () {
                                    //signup screen
                                  },
                                ),
                                Stack(
                                  children: <Widget>[
                                    new Icon(Icons.notifications,
                                        color:
                                        MyColors.textColorOnProfile_Blue),
                                    new Positioned(
                                      right: 0,
                                      child: new Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: new BoxDecoration(
                                          color:
                                          MyColors.textColorOnProfile_Blue,
                                          borderRadius:
                                          BorderRadius.circular(6),
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 12,
                                          minHeight: 12,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.5),
                                          child: Text(
                                            '12',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: new AssetImage(
                                  "assets/images/home_video.png"),
                              width: ConstantVariable.fourmPageSmallImageSize,
                              height: ConstantVariable.fourmPageSmallImageSize,
                              color: Colors.black,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                child: Image(
                                  image:
                                  new AssetImage("assets/images/call.png"),
                                  width:
                                  ConstantVariable.fourmPageSmallImageSize,
                                  height:
                                  ConstantVariable.fourmPageSmallImageSize,
                                  color: Colors.black,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                ),
                                onTap: () {
                                  ConstantMethods.showSnackBar(
                                      context, "audio click");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                child: Image(
                                  image: new AssetImage(
                                      "assets/images/user_image.png"),
                                  width: 30,
                                  height: 30,
                                  color: null,
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                ),
                                onTap: () {
                                  ConstantMethods.showSnackBar(
                                      context, "icon click");
                                },
                              ),
                            ),
                          ]),
                      onTap: () {
                        ConstantMethods.showSnackBar(context, "video click");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: slideList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return slideList.elementAt(index);
                  }),
            ),
          ])),
    );
  }
}
