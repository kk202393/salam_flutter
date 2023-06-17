import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/search/course_details.dart';

import '../../api_dir/ApiUrl.dart';
import '../../api_dir/ReturnApiResponse.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import '../../response_models_dir/all_courses_of_any_category/AllCoursesOfAnyCategory.dart';



class AllCoursesOfAnyCategoryScreen extends StatefulWidget {
  String id;
  AllCoursesOfAnyCategoryScreen(this.id);

  @override
  State<AllCoursesOfAnyCategoryScreen> createState() => _AllCoursesOfAnyCategoryScreenState();
}

class _AllCoursesOfAnyCategoryScreenState extends State<AllCoursesOfAnyCategoryScreen> {

  late Future<dynamic> futureAlbum;
  @override
  void initState() {
    print("initStateParam"+widget.id);

    setState(() {

      Map toMap() {
        var map = new Map();
        map["id"] = widget.id;
        return map;
      }
      futureAlbum = ReturnApisResponse().coursesListOfAnyCategory(toMap());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final double itemWidth  = (screenWidth) / 2;
    final double itemHeight = screenWidth / 2.8;
    return Scaffold(body: SafeArea(
      child: FutureBuilder<dynamic>(
        future: futureAlbum,
        builder: (context, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              ConstantMethods.showSnackBar(context, 'Error:${snapshot.error} ');
            }

            // if we got our data
            else if (snapshot.hasData && snapshot.data!=null && snapshot.data?.data!=null && snapshot.data?.data.length!=0
            ) {
              // Extracting data from snapshot object
              return SafeArea(child: Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      ConstantVariable.homeItemsLeftRightMargin_2, 0,
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
                                      "Course View",
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 210,
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/course_view_img.png',
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ]),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 15, 0, 2),
                                child: Text(
                                  //  "Content in this Course",
                                  //  "Content in "+" '' "+snapshot.data?.data[0]?.categoryName??""+" '' ",
                                  (snapshot.data?.data[0].categoryName==null)?"Content in this Course" :snapshot.data?.data[0].categoryName,

                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Grey,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                            //Expanded(child: AllCoursesOfAnyCategoryList(snapshot.data?.data[0].courseCategoryName)),
                          ]),
                    ),
                    AllCoursesOfAnyCategoryList(snapshot.data?.data[0].courseCategoryName),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                    )
                  ],
                ),));
            }

            else {
              print('getHomeCourseSearch: ${"emptyFound"}');
              return ConstantMethods.noDataFound("No data found of this category");

            }
          }
          // Displaying LoadingSpinner to indicate waiting state
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ),);
  }
  Widget get _space => const SizedBox(height: 2);
}




class AllCoursesOfAnyCategoryList extends StatelessWidget {
  List<CourseCategoryName>? data;
  AllCoursesOfAnyCategoryList(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final double itemWidth  = (screenWidth) / 2;
    final double itemHeight = screenWidth / 3.2;
    return SliverGrid(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 295.0,
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0),
      delegate: SliverChildBuilderDelegate(
        semanticIndexOffset: 2,
        childCount: data?.length??0,
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: itemHeight,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 5,top: 5),
                      child: (data?.elementAt(index).courseImageUrl==null)?
                      Image.asset(
                        'assets/images/ai.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )  :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          //imageUrl: ApiUrl.BASE_URL+data?.elementAt(index).courseImageUrl,
                          imageUrl: '${ApiUrl.BASE_URL}${data?.elementAt(index).courseImageUrl??"NA"}',
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          // height: screenWidth/3,
                          height: (itemWidth*55)/100,
                          width: (itemWidth*55)/100,
                          fit: BoxFit.cover,),
                      )  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 5,right: 5,top: 5),
                      child: Text(
                        data?.elementAt(index).displayName??"NA",
                        maxLines: 2,
                        style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.normal,
                            color: MyColors.black, fontSize: 18),
                      ),
                    ),
                    _space,
                    Padding(
                      padding:  EdgeInsets.only(left: 5,right: 5),
                      child: Text(
                        'Start Date:  ${data?.elementAt(index).enrollmentStart??"NA"}',
                        maxLines: 2,
                        style: TextStyle(
                            color: MyColors.activatedGrey, fontSize: 12),
                      ),
                    ),
                    _space,
                    _space,
                    Padding(
                      padding:  EdgeInsets.only(left: 5,right: 5),
                      child: Text(
                        'End Date:  ${data?.elementAt(index).enrollmentEnd??"NA"}',
                        maxLines: 2,
                        style: TextStyle(
                            color: MyColors.activatedGrey, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                      child: (data?.elementAt(index).enrollmentStart==null)?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: MyColors.facebookButtonColor,
                            side: BorderSide(
                              width: 1.0,
                              color: MyColors.facebookButtonColor,
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Enroll Now',style: TextStyle(
                            color: MyColors.white,
                            fontSize: ConstantVariable.drawerItemTvSize),
                        ),
                      ):
                      InkWell(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                        child:new Image(
                          image: new AssetImage("assets/images/play_blue_button.png"),
                          width: 30,
                          height: 30,
                          color: null,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        )

                        ,
                      ),
                        onTap: () {
                          if(data?.elementAt(index).id=='null'){
                            ConstantMethods.showSnackBar(context, ConstantVariable.invalidCourseId);
                          }else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsWithYouTubeVideo(data?.elementAt(index).id??"")));
                          }
                        },
                      ),
                    ),

                  ],)
                ],
              ),
            ),
          );
        },

      ),
    );
  }
  Widget get _space => const SizedBox(height: 2);
}























//class AllCoursesOfAnyCategoryList extends StatelessWidget {
//   List<CourseCategoryName>? data;
//   AllCoursesOfAnyCategoryList(this.data);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     final double itemWidth  = (screenWidth) / 2;
//     final double itemHeight = screenWidth / 2.8;
//     return Scaffold(body: GridView.count(
//       physics: NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       childAspectRatio: (itemHeight / itemWidth),
//       scrollDirection: Axis.vertical,
//       // Generate 100 widgets that display their index in the List.
//       children: List.generate(data?.length??0, (index) {
//
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(),
//             ),
//             child:Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(padding: EdgeInsets.all(0),
//                     child: (data?.elementAt(index).enrollmentStart==null)?
//                     CachedNetworkImage(
//                       //imageUrl: ApiUrl.BASE_URL+data?.elementAt(index).courseImageUrl,
//                       imageUrl: '${ApiUrl.BASE_URL}${data?.elementAt(index).courseImageUrl??"NA"}',
//                       placeholder: (context, url) => new CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => new Icon(Icons.error),
//                       // height: screenWidth/3,
//                       height: 100,
//                       width: itemWidth,
//                       fit: BoxFit.cover,):
//                     Image.asset(
//                       'assets/images/ai.png',
//                       height: 100,
//                       width: 100,
//                       fit: BoxFit.cover,
//                     )),
//                 Padding(
//                   padding:  EdgeInsets.only(left: 5,right: 5),
//                   child: Text(
//                     data?.elementAt(index).displayName??"NA",
//                     maxLines: 2,
//                     style: TextStyle(
//                         height: 1,
//                         fontWeight: FontWeight.normal,
//                         color: MyColors.black, fontSize: 18),
//                   ),
//                 ),
//                 _space,
//
//                 Padding(
//                   padding:  EdgeInsets.only(left: 5,right: 5),
//                   child: Text(
//                     'Start Date:  ${data?.elementAt(index).enrollmentStart??"NA"}',
//                     maxLines: 2,
//                     style: TextStyle(
//                         color: MyColors.activatedGrey, fontSize: 12),
//                   ),
//                 ),
//                 _space,
//                 _space,
//                 Padding(
//                   padding:  EdgeInsets.only(left: 5,right: 5),
//                   child: Text(
//                     'End Date:  ${data?.elementAt(index).enrollmentEnd??"NA"}',
//                     maxLines: 2,
//                     style: TextStyle(
//                         color: MyColors.activatedGrey, fontSize: 12),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: (data?.elementAt(index).enrollmentStart==null)?
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: MyColors.facebookButtonColor,
//                         side: BorderSide(
//                           width: 1.0,
//                           color: MyColors.facebookButtonColor,
//                         )),
//                     onPressed: () {},
//                     child: const Text(
//                       'Enroll Now',style: TextStyle(
//                         color: MyColors.white,
//                         fontSize: ConstantVariable.drawerItemTvSize),
//                     ),
//                   ):
//                   Container(),
//                 ),
//
//               ],
//             ),
//           ),
//         );
//       }),
//     ),);
//   }
//   Widget get _space => const SizedBox(height: 2);
// }