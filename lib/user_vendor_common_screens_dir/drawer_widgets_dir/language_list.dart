
import 'package:flutter/material.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/login_create_forgot_screens_dir/reset_password_screen.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';

class LanguagesList extends StatelessWidget {
  const LanguagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Container(
      padding: const EdgeInsets.fromLTRB(
          2, 0, 5, ConstantVariable.drawerBottomMargin),
      child: ExpansionTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: MyColors.white,
              side: BorderSide(
                width: ConstantVariable.drawerItemBorderWidth,
                color: MyColors.facebookButtonColor,
              )),
          onPressed: () {},
          child: const Text(
            ConstantVariable.selectLanguage,
            style: TextStyle(
                color: MyColors.facebookButtonColor,
                fontSize: ConstantVariable.drawerItemTvSize),
          ),
        ),
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {},
            child: const Text(
              "English",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {},
            child: const Text(
              "Hindi",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyColors.white,
                side: BorderSide(
                  width: ConstantVariable.expandableListItemBorderWidth,
                  color: MyColors.facebookButtonColor,
                )),
            onPressed: () {},
            child: const Text(
              "Urdu",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          ),
          ExpansionTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: MyColors.white,
                  side: BorderSide(
                    width: ConstantVariable.drawerItemBorderWidth,
                    color: MyColors.facebookButtonColor,
                  )),
              onPressed: () {},
              child: const Text(
                "More",
                style: TextStyle(
                    color: MyColors.facebookButtonColor,
                    fontSize: ConstantVariable.drawerItemTvSize),
              ),
            ),
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: MyColors.white,
                    side: BorderSide(
                      width: ConstantVariable.expandableListItemBorderWidth,
                      color: MyColors.facebookButtonColor,
                    )),
                onPressed: () {

                },
                child: const Text(
                  "British",
                  style: TextStyle(
                      color: MyColors.facebookButtonColor,
                      fontSize: ConstantVariable.expandableListItemTvSize),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
