// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/dummy_teacher_screen.dart';
// import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/language_list.dart';
// import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/payment_options_list.dart';
// import 'package:salam_flutter/user_vendor_common_screens_dir/drawer_widgets_dir/subcategories_of_profile.dart';
// import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/ststic_model_for_home_courses.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../constants/colors_dir/Colors.dart';
// import '../../constants/constant_variable/constant_variable.dart';
// import '../../constants/constant_widgets_dir/CustomWidget.dart';
//
//
// class CourseScreen extends StatefulWidget {
//   final String languageCode;
//
//   const CourseScreen( this.languageCode);
//
//
//   @override
//   _CourseScreenState createState() => _CourseScreenState();
// }
//
// class _CourseScreenState extends State<CourseScreen> {
//   String? encodedMap;
//   late String searchQueryText='';
//   int selectedIndex = 0;
//   bool onwillpop = false;
//   final searchQueryController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     SharedPreferences.getInstance().then((prefValue) => {
//       setState(() {
//         encodedMap = prefValue.getString(ConstantVariable.userData)?? "NA";
//
//       })
//     });
//
//   }
//
//   @override
//   void dispose() {
//     searchQueryController.dispose();
//     super.dispose();
//   }
//
//
//   //Widget currentPageOnMiddleSection = HomeMiddleSection("bb");
//   // final _pageOptions = [
//   //   HomeMiddleSection("aa")
//   // ];
//   // void onItemTapped(int index) {
//   //   setState(() {
//   //     selectedIndex = index;
//   //     currentPageOnMiddleSection = _pageOptions[selectedIndex];
//   //   });
//   // }
//   // Widget setMiddleSection(int index) {
//   //   return _pageOptions[index];
//   // }
//
//
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   void _showDialog() {
//
//     Dialog fancyDialog = Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 300,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Stack(
//           children: <Widget>[
//
//             Container(
//               width: double.infinity,
//               height: 50,
//               alignment: Alignment.bottomCenter,
//               decoration: BoxDecoration(
//                 color: MyColors.facebookButtonColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12),
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Course Search",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: double.infinity,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(12),
//                     bottomRight: Radius.circular(12),
//                   ),
//                 ),
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(
//                           ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
//                       child: TextField(
//                         keyboardType: TextInputType.emailAddress,
//                         textCapitalization: TextCapitalization.none,
//                         controller: searchQueryController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Course Name',
//                           hintText: 'Enter Course Name Here',
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             primary: MyColors.facebookButtonColor,
//                             side: BorderSide(
//                               width: 1.0,
//                               color: MyColors.facebookButtonColor,
//                             )),
//                         onPressed: () {
//                           dynamic searchQuery = searchQueryController.value.text;
//
//                           Navigator.pop(context);
//
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>  CourseScreen(searchQuery)),
//                                 (Route<dynamic> route) => false,
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: const Text(
//                             "Submit",
//                             style: TextStyle(
//                                 color: MyColors.white,
//                                 fontSize: ConstantVariable.drawerItemTvSize),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Align(
//               // These values are based on trial & error method
//               alignment: Alignment(1.05, -1.05),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     showDialog(
//         context: context, builder: (BuildContext context) => fancyDialog);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.homeTopMargin,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.facebookButtonColor,
//                       side: BorderSide(
//                         width: 1.0,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     ConstantVariable.home,
//                     style: TextStyle(
//                         color: MyColors.white,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.white,
//                       side: BorderSide(
//                         width: ConstantVariable.drawerItemBorderWidth,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     ConstantVariable.aboutUs,
//                     style: TextStyle(
//                         color: MyColors.facebookButtonColor,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//
//
//
//
//             LanguagesList(),
//
//
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.white,
//                       side: BorderSide(
//                         width: ConstantVariable.drawerItemBorderWidth,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     ConstantVariable.setBiometrics,
//                     style: TextStyle(
//                         color: MyColors.facebookButtonColor,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//
//
//
//
//             ProfileSubcategories(),
//
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.white,
//                       side: BorderSide(
//                         width: ConstantVariable.drawerItemBorderWidth,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     "Notification",
//                     style: TextStyle(
//                         color: MyColors.facebookButtonColor,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.white,
//                       side: BorderSide(
//                         width: ConstantVariable.drawerItemBorderWidth,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     "Ask Support",
//                     style: TextStyle(
//                         color: MyColors.facebookButtonColor,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//             PaymentOptions(),
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.white,
//                       side: BorderSide(
//                         width: ConstantVariable.drawerItemBorderWidth,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {},
//                   child: const Text(
//                     "Share the App",
//                     style: TextStyle(
//                         color: MyColors.facebookButtonColor,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//
//
//             Container(
//                 padding: const EdgeInsets.fromLTRB(
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     0,
//                     ConstantVariable.homeItemsLeftRightMargin,
//                     ConstantVariable.drawerBottomMargin),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: MyColors.facebookButtonColor,
//                       side: BorderSide(
//                         width: 1.0,
//                         color: MyColors.facebookButtonColor,
//                       )),
//                   onPressed: () {
//                     ConstantMethods.setLoggedOut(context);
//
//                   },
//                   child: const Text(
//                     ConstantVariable.logout,
//                     style: TextStyle(
//                         color: MyColors.white,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                   ),
//                 )),
//             DummyList(),
//             DummyTeacherScreen()
//           ],
//         ),
//       ),
//
//
//       body: Scaffold(
//         body: SafeArea(
//             child: Stack(
//               children: [
//                 Container(
//                   child: HomeMiddleSection(widget.languageCode),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       height: 50.0,
//                       width: 50.0,
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.dehaze,
//                           color: MyColors.facebookButtonColor,
//                         ),
//                         onPressed: () {
//                           if (_scaffoldKey.currentState?.isDrawerOpen == false) {
//                             _scaffoldKey.currentState?.openDrawer();
//                           } else {
//                             _scaffoldKey.currentState?.openEndDrawer();
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )) ,
//       ),
//
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         height: 70,
//         color: MyColors.homeBottomMenuBgcolor,
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 15),
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.all(0),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: navigationList.length,
//                 reverse: false,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ConstantMethods.imageIconWhite(navigationList.elementAt(index).img),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             navigationList.elementAt(index).title,
//                             style: TextStyle(color: MyColors.white, fontSize: 8),
//                           ),
//                         ),
//                       ],
//                     ),
//                     onTap: () {
//
//                       if (index == 0) {
//                         // home button clicked
//                         Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const CourseScreen("NA")),
//                               (Route<dynamic> route) => false,
//                         );
//                       }
//                       else if (index == 1) {
//                         // search button clicked
//                         return _showDialog();
//                       }
//                       else if (index == 4) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) =>
//                                 ChatListScreen(courseListOfModels)));
//                       } else if (index == 2) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AssessmentScreen()));
//                       }
//                       else if (index == 5) {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => GroupChatScreen()));
//                       }
//                     },
//                   );
//                 }),
//           ),
//         ),
//       ),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.homeTopMargin,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.home,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.aboutUs,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           LanguagesList(),
//
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.setBiometrics,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           ProfileSubcategories(),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Notification",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Ask Support",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           PaymentOptions(),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Share the App",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {
//                   ConstantMethods.setLoggedOut(context);
//
//                 },
//                 child: const Text(
//                   ConstantVariable.logout,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           DummyList(),
//           DummyTeacherScreen()
//         ],
//       ),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.homeTopMargin,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.home,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.aboutUs,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           LanguagesList(),
//
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.setBiometrics,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           ProfileSubcategories(),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Notification",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Ask Support",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           PaymentOptions(),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Share the App",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {
//                   ConstantMethods.setLoggedOut(context);
//
//                 },
//                 child: const Text(
//                   ConstantVariable.logout,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           DummyList(),
//           DummyTeacherScreen()
//         ],
//       ),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.homeTopMargin,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.home,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.aboutUs,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           LanguagesList(),
//
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.setBiometrics,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           ProfileSubcategories(),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Notification",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Ask Support",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           PaymentOptions(),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Share the App",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {
//                   ConstantMethods.setLoggedOut(context);
//
//                 },
//                 child: const Text(
//                   ConstantVariable.logout,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           DummyList(),
//           DummyTeacherScreen()
//         ],
//       ),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.homeTopMargin,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.home,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.aboutUs,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           LanguagesList(),
//
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   ConstantVariable.setBiometrics,
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//
//
//           ProfileSubcategories(),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Notification",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Ask Support",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//           PaymentOptions(),
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.white,
//                     side: BorderSide(
//                       width: ConstantVariable.drawerItemBorderWidth,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {},
//                 child: const Text(
//                   "Share the App",
//                   style: TextStyle(
//                       color: MyColors.facebookButtonColor,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//
//
//           Container(
//               padding: const EdgeInsets.fromLTRB(
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   0,
//                   ConstantVariable.homeItemsLeftRightMargin,
//                   ConstantVariable.drawerBottomMargin),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: MyColors.facebookButtonColor,
//                     side: BorderSide(
//                       width: 1.0,
//                       color: MyColors.facebookButtonColor,
//                     )),
//                 onPressed: () {
//                   ConstantMethods.setLoggedOut(context);
//
//                 },
//                 child: const Text(
//                   ConstantVariable.logout,
//                   style: TextStyle(
//                       color: MyColors.white,
//                       fontSize: ConstantVariable.drawerItemTvSize),
//                 ),
//               )),
//     Container(
//     padding: const EdgeInsets.fromLTRB(
//     2, 0, 5, ConstantVariable.drawerBottomMargin),
//     child: ExpansionTile(
//     title: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.drawerItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {},
//     child: const Text(
//     "Test Screen Teacher",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.drawerItemTvSize),
//     ),
//     ),
//     children: <Widget>[
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingClassesScreen()
//     ));
//     },
//     child: const Text(
//     "UpcomingClasses",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => AssessmentReportTeacherScreen()
//     ));
//     },
//     child: const Text(
//     "AssessmentReportScreen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingCourseScreen()
//     ));
//     },
//     child: const Text(
//     "Upcoming Course Screen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ],
//     ),
//     ),
//     Container(
//     padding: const EdgeInsets.fromLTRB(
//     2, 0, 5, ConstantVariable.drawerBottomMargin),
//     child: ExpansionTile(
//     title: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.drawerItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {},
//     child: const Text(
//     "Test Screen Teacher",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.drawerItemTvSize),
//     ),
//     ),
//     children: <Widget>[
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingClassesScreen()
//     ));
//     },
//     child: const Text(
//     "UpcomingClasses",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => AssessmentReportTeacherScreen()
//     ));
//     },
//     child: const Text(
//     "AssessmentReportScreen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingCourseScreen()
//     ));
//     },
//     child: const Text(
//     "Upcoming Course Screen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ],
//     ),
//     );,
//     Container(
//     padding: const EdgeInsets.fromLTRB(
//     2, 0, 5, ConstantVariable.drawerBottomMargin),
//     child: ExpansionTile(
//     title: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.drawerItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {},
//     child: const Text(
//     "Test Screen Teacher",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.drawerItemTvSize),
//     ),
//     ),
//     children: <Widget>[
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingClassesScreen()
//     ));
//     },
//     child: const Text(
//     "UpcomingClasses",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => AssessmentReportTeacherScreen()
//     ));
//     },
//     child: const Text(
//     "AssessmentReportScreen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: MyColors.white,
//     side: BorderSide(
//     width: ConstantVariable.expandableListItemBorderWidth,
//     color: MyColors.facebookButtonColor,
//     )),
//     onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => UpcomingCourseScreen()
//     ));
//     },
//     child: const Text(
//     "Upcoming Course Screen",
//     style: TextStyle(
//     color: MyColors.facebookButtonColor,
//     fontSize: ConstantVariable.expandableListItemTvSize),
//     ),
//     ),
//     ],
//     ),
//     );
//         ],
//       ),
//       // bottomNavigationBar: BottomNavigation(navigationList),
//     );
//
//   }
//
//
// }
//
