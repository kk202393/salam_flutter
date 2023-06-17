
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fourm_dir/fourm_screen.dart';
import '../../user_vendor_common_screens_dir/chat_dir/chat_list.dart';
import '../../user_vendor_common_screens_dir/home_screen_dir/home_scren.dart';
import '../../user_vendor_common_screens_dir/home_screen_dir/ststic_model_for_home_courses.dart';
import '../../user_vendor_common_screens_dir/login_create_forgot_screens_dir/login_screen.dart';
import '../colors_dir/Colors.dart';
import '../constant_variable/constant_variable.dart';

class ConstantMethods{


  static Widget custombutton(Color bgcolor, String text){

    return ElevatedButton(onPressed: (){},
      child: Text(text,style: TextStyle(color: bgcolor,fontSize: 15,fontFamily: ConstantVariable.MuktaBold),),
      style: ElevatedButton.styleFrom(
          primary: MyColors.facebookButtonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
          shadowColor: Colors.red,
          elevation: 2
      ),);
  }
  static Widget custombutton2(double tvSize,Color tvColor, String text,Color buttonColor, double buttonCorner,String tvFont){

    return ElevatedButton(onPressed: (){},
      child: Text(text,style: TextStyle(color: tvColor,fontSize: tvSize,fontFamily: tvFont),),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCorner),),
          elevation: 0
      ),);
  }
  static Widget customCircle(Color bgcolor, String text){

    return ElevatedButton(onPressed: (){},
      child: Text(text,style: TextStyle(color: bgcolor,fontSize: 15,fontFamily: ConstantVariable.MuktaBold),),
      style: ElevatedButton.styleFrom(
          primary: MyColors.facebookButtonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
          shadowColor: Colors.red,
          elevation: 2
      ),);
  }

  static Widget imageIcon(String image){
    return ImageIcon(AssetImage(image) );
  }

  static Widget imageIconWhite(String image){

    if(image=="Uni Course"){
      return Icon(Icons.star);
    }
    else return Image(
      image: new AssetImage(
          image),
      width: 20,
      height: 20,
      color: Colors.white,
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
    );
  }

  static Object returnSelectedPageFromBottomNavigation(BuildContext context,int position){
    if(position==0){
      return Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => const HomeScreen("NA")),
            (Route<dynamic> route) => false,
      );
    }
    else  if(position==1){
      return Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumsStudentScreen()));
    }

    else  if(position==4){
      return Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatListScreen(courseListOfModels)));
    }

    else return  Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => const HomeScreen("NA")),
            (Route<dynamic> route) => false,
      );

  }
  static  Widget noDataFound(String msg1){
    return LayoutBuilder(
      builder: (BuildContext context,
          BoxConstraints viewportConstraints) {
        return Container(

          child: Center(child:
          Stack(
            children: <Widget>[

              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: MyColors.googleButtonColor
                  ,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Not Found",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: 150,

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
                        child: Text(
                          msg1,
                          //"No data found with your search ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: MyColors.facebookButtonColor,
                              side: BorderSide(
                                width: 1.0,
                                color: MyColors.facebookButtonColor,
                              )),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen("NA")),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Go To Home",
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontSize: ConstantVariable.drawerItemTvSize),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),

              Align(
                // These values are based on trial & error method
                alignment: Alignment(1.05, -1.05),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
  static TextStyle textStyle(){
    return const TextStyle(
        fontSize: 15.0,
        height: 0.6,
        color: Colors.black
    );
  }
  static void setLoggedOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ConstantVariable.isUserLoggedIn, false);
    await prefs.remove(ConstantVariable.userData);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const LoginScreen(
            languageCode: '',
          )),
          (Route<dynamic> route) => false,
    );
  }
  static void showSnackBar(BuildContext context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}