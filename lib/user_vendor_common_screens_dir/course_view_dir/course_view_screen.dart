import 'package:flutter/material.dart';

import '../../api_dir/ReturnApiResponse.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import '../../response_models_dir/all_courses_of_any_category/AllCoursesOfAnyCategory.dart';



class CourseViewScreen extends StatefulWidget {
   String id;
   CourseViewScreen(this.id);

  @override
  State<CourseViewScreen> createState() => _CourseViewScreenState();
}

class _CourseViewScreenState extends State<CourseViewScreen> {

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
    double screenHeight = MediaQuery.of(context).size.height;
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
              return SafeArea(child: Scaffold(body:
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
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
                              (snapshot.data?.data[0].categoryName==null)?"":"Content in this Course",

                              style: TextStyle(
                                  color: MyColors.textColorOnProfile_Grey,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        CourseList(snapshot.data?.data),
                      ])),));
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
}


class CourseList extends StatefulWidget {
   CourseList(List<DataA>? data, {Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 15,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    color: MyColors.grey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 15,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 2, 0),
                            child: Text(
                              "01",
                              style:
                              TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 25),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 70,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(
                                    "5.20 min",
                                    style:
                                    TextStyle(color: MyColors.textColorOnProfile_Black, fontSize: 12),
                                  ),
                                ),
                                Text(
                                  "Graphic Designer Graphic Designer Graphic Designer Graphic Designer",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: MyColors.textColorOnProfile_Black, fontSize: 15),
                                ),

                              ],
                            ),

                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
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
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}


