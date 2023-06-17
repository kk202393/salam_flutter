import 'package:flutter/material.dart';
import 'package:salam_flutter/teacher_dir/UpcomingClasses_Dir/timing_list.dart';

import '../../constants/colors_dir/Colors.dart';

class UpcomingClassesList extends StatelessWidget {
  final slideList;

  UpcomingClassesList(this.slideList);

  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        itemCount: slideList.length,
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8,10,8,10),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slideList[index]['bachName'],
                    style: TextStyle(
                        fontSize: 20,
                        color: MyColors.homeBottomMenuBgcolor),
                  ),
                  TimingList(slideList[index]['timing'])
                ],
              ),
            ),
          );
        }),);
  }
}
