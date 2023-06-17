import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/search/course_details.dart';

import '../../api_dir/ApiUrl.dart';
import '../../api_dir/ReturnApiResponse.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import '../../response_models_dir/courses/CourseCategoryName.dart';
import '../../response_models_dir/courses/Datum.dart';
import '../course_view_dir/course_view_screen.dart';
import 'all_courses_of_any_category.dart';


class HomeMiddleSection extends StatefulWidget {
  final String searchQuery;
  final String isStaff;
  final int userId;
  const HomeMiddleSection(this.searchQuery,this.isStaff,this.userId);

  @override
  _HomeMiddleSectionState createState() => _HomeMiddleSectionState();


}

class _HomeMiddleSectionState extends State<HomeMiddleSection> {
  late Future<dynamic> futureAlbum;

  @override
  void dispose() {
    // listener.cancel();
    super.dispose();
  }
  @override
  void initState() {
    print("initStateParam"+widget.searchQuery);
    print("initStateParam"+widget.isStaff);
    print("initStateParam"+widget.userId.toString());

    setState(() {
        dashboardApi();
    });
    super.initState();
  }

  void dashboardApi(){
    try{

      Map toMap() {
        var map = new Map();
         map["id"] = widget.userId.toString();
         // map["is_staff"] =widget.isStaff.toString();
        return map;
      }
      futureAlbum = ReturnApisResponse().dashboard(toMap());
    }
    catch(e){
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child:FutureBuilder<dynamic>(
        future: futureAlbum,
        builder: (context, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              ConstantMethods.showSnackBar(context, 'Error:${snapshot.error} ');
            }

            // if we got our data
            else if (snapshot.hasData && snapshot.data!=null && snapshot.data?.success==200
                && (snapshot.data?.dashboardData.length!=0 || snapshot.data?.studentCourseData.length!=0)
            ) {
              // Extracting data from snapshot object
              return LayoutBuilder(
                builder: (BuildContext context,
                    BoxConstraints viewportConstraints) {
                  return Container(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: (screenHeight*25)/100,
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/home_top_image.jpg',
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ]),
                              ),
                              Container(
                                color: Colors.white,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 2),
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                        color: MyColors.facebookButtonColor,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),
                              HomeCategoriesChipsetList(snapshot.data?.dashboardData),
                              ParentOfAllList_widget(snapshot.data?.dashboardData,snapshot.data?.studentCourseData),
                            ])),
                  );
                },
              );
            }

            else {
              return  Container();
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}


class ParentOfAllList_widget extends StatelessWidget {
  final List<Datum>? slideList;

  final List<List<CourseCategoryName>>? studentUniCourses;
  ParentOfAllList_widget(this.slideList,this.studentUniCourses);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 8,right: 8),
              scrollDirection: Axis.vertical,
              itemCount: slideList?.length,

              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            slideList?.elementAt(index).categoryName?? "NA",
                            style: TextStyle(
                                color: MyColors.facebookButtonColor,
                                fontSize: 18,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      HomeCoursesList(slideList?[index].courseCategoryName?? "NA"),

                    ],
                  ),
                );
              }),

          Container(
              child: (studentUniCourses==null ||  studentUniCourses?.length==0)?
              Center():
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 2),
                      child: Text(
                        "My Uni Courses",

                        style: TextStyle(
                            color: MyColors.facebookButtonColor,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: MyUniCourses(studentUniCourses?? []),
                  ),
                ],
              )
          )
        ]) ;
  }

}


class MyUniCourses extends StatelessWidget {
  final List<List<CourseCategoryName>>? slideList;

  MyUniCourses(this.slideList);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: screenWidth * .50,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: slideList?.length,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: Padding(
              padding: const EdgeInsets.all(4.0),

              child: InkWell(
                child: Container(
                  width: screenWidth * 0.32,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FadeInImage.assetNetwork(
                        //     placeholder: 'assets/images/home_top_image.jpg',
                        //     image:ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                        //   height: screenWidth * 0.35,
                        //   fit: BoxFit.cover,
                        // ),
                        // CachedNetworkImage(
                        //   width: double.infinity,
                        //   height: 250,
                        //   fit: BoxFit.cover,
                        //   imageUrl: ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                        //       CircularProgressIndicator(value: downloadProgress.progress),
                        //   errorWidget: (context, url, error) => Icon(
                        //     Icons.error,
                        //     size: 100,
                        //     color: Colors.red,
                        //   ),
                        // ),
                        CachedNetworkImage(
                          imageUrl: ApiUrl.BASE_URL+slideList![index][0].courseImageUrl,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          height: screenWidth * 0.25,
                          fit: BoxFit.cover,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
                          child: Text(
                            slideList![index][0].displayName.toString().trim(),
                            maxLines: 2,

                            style: TextStyle(
                              color: MyColors.black, fontSize: 15,),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //         color: MyColors.black, fontSize: 13),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //         color: MyColors.activatedGrey, fontSize: 13),
                        //   ),
                        // ),
                        // Container(
                        //   child: RatingBar.builder(
                        //     initialRating: 0,
                        //     itemSize: 15,
                        //     direction: Axis.horizontal,
                        //     allowHalfRating: false,
                        //     itemCount: 5,
                        //     itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        //     itemBuilder: (context, _) => Icon(
                        //       Icons.star,
                        //       color: Colors.amber,
                        //     ),
                        //     onRatingUpdate: (rating) {
                        //       print(rating);
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(color: MyColors.black, fontSize: 10),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  if(slideList![index][0].id=='null'){
                    ConstantMethods.showSnackBar(context, ConstantVariable.invalidCourseId);
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsWithYouTubeVideo(slideList![index][0].id)));
                  }
                },
              ),
            ),);
          }),
    );
  }
}

class HomeCoursesList extends StatelessWidget {
  final slideList;
  HomeCoursesList(this.slideList);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: screenWidth * .55,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: slideList.length,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: Padding(
              padding: const EdgeInsets.all(4.0),

              child: InkWell(
                child: Container(
                  width: screenWidth * 0.35,

                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FadeInImage.assetNetwork(
                        //     placeholder: 'assets/images/home_top_image.jpg',
                        //     image:ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                        //   height: screenWidth * 0.35,
                        //   fit: BoxFit.cover,
                        // ),
                        // CachedNetworkImage(
                        //   width: double.infinity,
                        //   height: 250,
                        //   fit: BoxFit.cover,
                        //   imageUrl: ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                        //       CircularProgressIndicator(value: downloadProgress.progress),
                        //   errorWidget: (context, url, error) => Icon(
                        //     Icons.error,
                        //     size: 100,
                        //     color: Colors.red,
                        //   ),
                        // ),
                        CachedNetworkImage(
                          imageUrl: ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          height: screenWidth * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
                          child: Text(
                            slideList[index].displayName.toString().trim(),
                            maxLines: 2,

                            style: TextStyle(
                              color: MyColors.black, fontSize: 15,),
                          ),
                        ),


                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //         color: MyColors.black, fontSize: 13),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //         color: MyColors.activatedGrey, fontSize: 13),
                        //   ),
                        // ),
                        // Container(
                        //   child: RatingBar.builder(
                        //     initialRating: 0,
                        //     itemSize: 15,
                        //     direction: Axis.horizontal,
                        //     allowHalfRating: false,
                        //     itemCount: 5,
                        //     itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        //     itemBuilder: (context, _) => Icon(
                        //       Icons.star,
                        //       color: Colors.amber,
                        //     ),
                        //     onRatingUpdate: (rating) {
                        //       print(rating);
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 0.0, vertical: 2),
                        //   child: Text(
                        //     "NA",
                        //     maxLines: 1,
                        //     style: TextStyle(color: MyColors.black, fontSize: 10),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  if(slideList[index].id==null){
                    ConstantMethods.showSnackBar(context, ConstantVariable.invalidCourseId);
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailsWithYouTubeVideo(slideList[index].id.toString())));
                  }
                },
              ),
            ),);
          }),
    );
  }
}

class HomeCategoriesChipsetList extends StatelessWidget {
  final List<Datum>? slideList;

  HomeCategoriesChipsetList(this.slideList);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          spacing: 10,
          children: slideList
              ?.map((chip) => InkWell(child: Chip(
            key: ValueKey(chip.categoryId),
            label: Text(chip.categoryName,style: TextStyle(color: MyColors.white,fontSize: 12),),
            backgroundColor: MyColors.facebookButtonColor,
            padding:
            const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            // deleteIconColor: Colors.red,
            // onDeleted: () => _deleteChip(chip.id),
          ), onTap: (){

            if(chip.categoryId.toString()=='null'){
              ConstantMethods.showSnackBar(context, ConstantVariable.invalidCourseId);
            }else{
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllCoursesOfAnyCategoryScreen(chip.categoryId.toString())
                 // builder: (context) => AllCoursesOfAnyCategoryList()
              ));
            }
          },)).toList()?? [],
        ),
      ),
    );
  }
}


