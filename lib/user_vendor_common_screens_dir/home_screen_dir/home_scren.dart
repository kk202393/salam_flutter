import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/dummy_teacher_screen.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/language_list.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/payment_options_list.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/subcategories_of_profile.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/ststic_model_for_home_courses.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import '../../response_models_dir/login_response/LoginResponse.dart';
import '../assessment_dir/AssessmentScreen.dart';
import '../chat_dir/GroupChatScreen.dart';
import '../chat_dir/chat_list.dart';
import '../custom_bottom_nevigation/BottomNavigation.dart';
import '../custom_bottom_nevigation/NavigationListItemModel.dart';
import '../drawer_widgets_dir/dummy.dart';
import 'SearchScreen.dart';
import 'home_middle_section.dart';

class HomeScreen extends StatefulWidget {
  final String searchQuery;

  const HomeScreen( this.searchQuery);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  bool onwillpop = false;
  final searchQueryController = TextEditingController();
  Map<String, dynamic>? map;

  @override
  void initState() {
    super.initState();

    setState(() {
      SharedPreferences.getInstance().then((prefValue) => {
        setState(() {

          String  decoded = prefValue.getString(ConstantVariable.userData)?? "NA";
          map = json.decode(decoded);

          print("initStateParam" +" is_staff = "+map!['is_staff'].toString()+" userId = "+map!['user_id'].toString());

        })
      });
    });

  }

  @override
  void dispose() {
    searchQueryController.dispose();
    super.dispose();
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSearchDialog() {

    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: <Widget>[

            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: MyColors.facebookButtonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Course Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        controller: searchQueryController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Course Name',
                            hintText: 'Enter Course Name Here',
                           ),
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
                           String searchQuery = searchQueryController.value.text;

                           if(searchQuery.isNotEmpty){
                             Navigator.pop(context);
                             selectedIndex = 22;
                             Navigator.pushAndRemoveUntil(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>  HomeScreen(searchQuery)),
                                   (Route<dynamic> route) => false,
                             );
                           }else{
                             ConstantMethods.showSnackBar(context, "Can't empty");
                           }

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: ConstantVariable.drawerItemTvSize),
                          ),
                        ),
                      ),
                    ),
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
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }


  Future<bool> _exitConfirm() async {

    // This dialog will exit your app on saying yes
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure ?'),
        content: new Text('Do you want to exit.'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                side: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                )),
            onPressed: () {
              Navigator.of(context).pop(false);

            },
            child: const Text(
              "No",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),

          new ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                side: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                )),
            onPressed: () {
              Navigator.of(context).pop(true);

            },
            child: const Text(
              "Yes",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    )) ??
        false;

  }


  void home(String input){
    selectedIndex = 0;
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => const HomeScreen("NA")),
          (Route<dynamic> route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{

      if(selectedIndex == 0 && widget.searchQuery=="NA")
        return _exitConfirm();
      setState(() {
        home("NA");

      });
      return false;

    },child: Scaffold(
      backgroundColor: MyColors.white,
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.homeTopMargin,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.facebookButtonColor,
                      side: BorderSide(
                        width: 1.0,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    ConstantVariable.home,
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),

            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      side: BorderSide(
                        width: ConstantVariable.drawerItemBorderWidth,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    ConstantVariable.aboutUs,
                    style: TextStyle(
                        color: MyColors.facebookButtonColor,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),

            LanguagesList(),

            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      side: BorderSide(
                        width: ConstantVariable.drawerItemBorderWidth,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    ConstantVariable.setBiometrics,
                    style: TextStyle(
                        color: MyColors.facebookButtonColor,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),

            ProfileSubcategories(),

            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      side: BorderSide(
                        width: ConstantVariable.drawerItemBorderWidth,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    "Notification",
                    style: TextStyle(
                        color: MyColors.facebookButtonColor,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),

            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      side: BorderSide(
                        width: ConstantVariable.drawerItemBorderWidth,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    "Ask Support",
                    style: TextStyle(
                        color: MyColors.facebookButtonColor,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),
            PaymentOptions(),

            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      side: BorderSide(
                        width: ConstantVariable.drawerItemBorderWidth,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {},
                  child: const Text(
                    "Share the App",
                    style: TextStyle(
                        color: MyColors.facebookButtonColor,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),


            Container(
                padding: const EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin,
                    0,
                    ConstantVariable.homeItemsLeftRightMargin,
                    ConstantVariable.drawerBottomMargin),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.facebookButtonColor,
                      side: BorderSide(
                        width: 1.0,
                        color: MyColors.facebookButtonColor,
                      )),
                  onPressed: () {
                    ConstantMethods.setLoggedOut(context);

                  },
                  child: const Text(
                    ConstantVariable.logout,
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: ConstantVariable.drawerItemTvSize),
                  ),
                )),
            DummyList(),
            DummyTeacherScreen()
          ],
        ),
      ),

      body: Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Container(
                  child:(widget.searchQuery=="NA")?
                  HomeMiddleSection(widget.searchQuery,map!['is_staff'].toString(),map!['user_id'])
                      :SearchScreen(widget.searchQuery),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.dehaze,
                          color: MyColors.facebookButtonColor,
                        ),
                        onPressed: () {
                          if (_scaffoldKey.currentState?.isDrawerOpen == false) {
                            _scaffoldKey.currentState?.openDrawer();
                          } else {
                            _scaffoldKey.currentState?.openEndDrawer();
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            )) ,
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        color: MyColors.homeBottomMenuBgcolor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: navigationList.length,
                reverse: false,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstantMethods.imageIconWhite(navigationList.elementAt(index).img),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            navigationList.elementAt(index).title,
                            style: TextStyle(color: MyColors.white, fontSize: 8),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      selectedIndex=index;
                      if (index == 0) {
                        // home button clicked
                        home("NA");
                      }
                      else if (index == 1) {
                        // search button clicked
                        return _showSearchDialog();
                      }
                      else if (index == 4) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatListScreen(courseListOfModels)));
                      } else if (index == 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AssessmentQuestionScreen()));
                      }
                      else if (index == 5) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GroupChatScreen()));
                      }
                    },
                  );
                }),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(navigationList),
    )
    );
  }
}

