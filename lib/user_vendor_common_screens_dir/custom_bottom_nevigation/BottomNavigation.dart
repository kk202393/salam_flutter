// import 'package:flutter/material.dart';
//
// import '../../constants/colors_dir/Colors.dart';
// import '../../constants/constant_widgets_dir/CustomWidget.dart';
// import '../assessment_dir/AssessmentScreen.dart';
// import '../assessment_dir/AssismentListModelStatic.dart';
// import '../chat_dir/GroupChatScreen.dart';
// import '../chat_dir/chat_list.dart';
// import '../home_screen_dir/home_scren.dart';
// import '../home_screen_dir/ststic_model_for_home_courses.dart';
//
// class BottomNavigation extends StatelessWidget {
//   final slideList;
//
//   BottomNavigation(this.slideList);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,
//       color: MyColors.homeBottomMenuBgcolor,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: ListView.builder(
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(0),
//               scrollDirection: Axis.horizontal,
//               itemCount: slideList.length,
//               reverse: false,
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ConstantMethods.imageIconWhite(slideList.elementAt(index).img),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           slideList.elementAt(index).title,
//                           style: TextStyle(color: MyColors.white, fontSize: 8),
//                         ),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//
//                     if (index == 0) {
//                       // home button clicked
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomeScreen(languageCode: "NA",)),
//                         (Route<dynamic> route) => false,
//                       );
//                     }
//                     else if (index == 1) {
//                       // search button clicked
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               ChatListScreen(courseListOfModels)));
//                     }
//                     else if (index == 4) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               ChatListScreen(courseListOfModels)));
//                     } else if (index == 2) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => AssessmentScreen()));
//                     }
//                     else if (index == 5) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => GroupChatScreen()));
//                     }
//                   },
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
