import 'package:flutter/material.dart';
import 'package:salam_flutter/constants/colors_dir/Colors.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/login_create_forgot_screens_dir/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constant_variable/constant_variable.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  void _setGetStartScreenLaunchedBefore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(ConstantVariable.isGetStartScreenLaunchedBefore, true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: MyColors.textColorOnProfile_Blue,
      body: SingleChildScrollView(child: Center(
        child: LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth>1024){
            return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      image: new AssetImage("assets/images/open_book.png"),
                      color: null,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,40,20,0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "WELCOME!",
                          style: TextStyle(
                            fontSize: 18,
                            color: MyColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 200, 0, 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: MyColors.textColorOnProfile_Blue,
                          side: BorderSide(
                            width: ConstantVariable.drawerItemBorderWidth,
                            color: MyColors.white,
                          )),
                      onPressed: () {
                        _setGetStartScreenLaunchedBefore();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen(
                                languageCode: '',
                              )),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                        child: const Text(
                          "Get Start",
                          style: TextStyle(
                              color: MyColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ]);
          }else{
            return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Image(
                      image: new AssetImage("assets/images/open_book.png"),
                      color: null,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,40,20,0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "WELCOME!",
                          style: TextStyle(
                              fontSize: 35,
                              color: MyColors.white,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 200, 0, 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: MyColors.textColorOnProfile_Blue,
                          side: BorderSide(
                            width: ConstantVariable.drawerItemBorderWidth,
                            color: MyColors.white,
                          )),
                      onPressed: () {
                        _setGetStartScreenLaunchedBefore();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen(
                                languageCode: '',
                              )),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                        child: const Text(
                          "Get Start",
                          style: TextStyle(
                              color: MyColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ]);
          }
        }),
      )),
    ));
  }
}
