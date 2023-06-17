import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api_dir/ApiUrl.dart';
import '../../../constants/colors_dir/Colors.dart';
import '../../../constants/constant_widgets_dir/CustomWidget.dart';
import 'course_details.dart';

class SearchedResultList extends StatelessWidget {
  final  slideList;

  SearchedResultList(this.slideList);
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
          itemCount: slideList.length,
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
                        CachedNetworkImage(
                          imageUrl: ApiUrl.BASE_URL+slideList[index].courseImageUrl,
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          height: screenWidth * 0.25,
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
                    ConstantMethods.showSnackBar(context, "Invalid Course Id");

                    //ConstantMethods.showSnackBar(context, slideList[index].displayName.toString());
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        CourseDetailsWithYouTubeVideo(slideList[index].id.toString())));
                  }
                },
              ),
            ),);
          }),
    );
  }
}
