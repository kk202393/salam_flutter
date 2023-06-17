import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/search/searched_result.dart';

import '../../api_dir/ReturnApiResponse.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  const SearchScreen(this.searchQuery);



  @override
  _SearchScreenState createState() => _SearchScreenState();


}

class _SearchScreenState extends State<SearchScreen> {
  late Future<dynamic> futureAlbum;


  @override
  void initState() {
    print("initStateParam"+widget.searchQuery);

    setState(() {
      futureAlbum = ReturnApisResponse().getHomeCourseSearch(widget.searchQuery);
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
            else if (snapshot.hasData && snapshot.data!=null && snapshot.data?.results!=null && snapshot.data?.results.length!=0
            ) {
              // Extracting data from snapshot object
              return LayoutBuilder(
                builder: (BuildContext context,
                    BoxConstraints viewportConstraints) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50,bottom: 10),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          child:Column(
                            children: [Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 2),
                              child: Text(
                                "Search"+" '' "+widget.searchQuery+" '' ",
                                style: TextStyle(
                                    color: MyColors.facebookButtonColor,
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data?.results.length,

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
                                                snapshot.data?.results.elementAt(index).categoryName.toString()?? "NA",

                                                style: TextStyle(
                                                    color: MyColors.facebookButtonColor,
                                                    fontSize: 18,
                                                    fontStyle: FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                          SearchedResultList(snapshot.data?.results[index].courseCategoryName?? []),

                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          )),
                    ),
                  );
                },
              );
            }

            else {
              print('getHomeCourseSearch: ${"emptyFound"}');
              return ConstantMethods.noDataFound("No data found with your search "+" '' "+widget.searchQuery+" '' ") ;

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

