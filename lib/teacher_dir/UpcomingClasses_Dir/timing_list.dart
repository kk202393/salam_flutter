import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
class TimingList extends StatelessWidget {
  final slideList;

  TimingList(this.slideList);


  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: slideList.length,
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    slideList[index]['dayNameAndTime'],
                    style: TextStyle(
                        fontSize: 15,
                        color: MyColors.activatedGrey),
                  ),
                ),

              ],
            ),
          );
        }),);
  }
}
