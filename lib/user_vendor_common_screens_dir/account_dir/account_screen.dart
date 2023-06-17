import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                            "Account",
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
                          maxRadius: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "First Name:Sunil",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 20),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Last Name:Dutt",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Gender:Male",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Email:sunil.dutt@gmail.com",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Phone:+91-981234567",
                          style: TextStyle(
                              color: MyColors.textColorOnProfile_Blue,
                              fontSize: 17),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  "Edit profile",
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
                                onPressed: () {},
                                child: Text(
                                  "Logout",
                                  style:
                                  TextStyle(color: MyColors.white, fontSize: 15),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),

                ])),
      ),
    ));
  }
}
