import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';

class PaidCourseList extends StatelessWidget {
  final slideList;

  PaidCourseList(this.slideList);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final double itemHeight = (screenWidth) / 2;
    final double itemWidth = screenWidth / 1.2;
    return Scaffold(body: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      scrollDirection: Axis.vertical,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(slideList.length, (index) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/ai.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(25, 0, 5, 0),
                    child: Text(
                      slideList.elementAt(index).title,
                      maxLines: 2,
                      style: TextStyle(
                          color: MyColors.black, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(25, 0, 5, 0),
                    child: Text(
                      "Release:"+slideList.elementAt(index).releaseDate+" To "+slideList.elementAt(index).expireDate,
                      maxLines: 2,
                      style: TextStyle(
                          color: MyColors.activatedGrey, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyColors.facebookButtonColor,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(0.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Enroll Now",
                              style:
                              TextStyle(color: MyColors.white, fontSize: 13),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            slideList.elementAt(index).mrp,
                            maxLines: 2,
                            style: TextStyle(color: MyColors.homeBottomMenuBgcolor, fontSize: 13),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }),
    ),);
  }
}

