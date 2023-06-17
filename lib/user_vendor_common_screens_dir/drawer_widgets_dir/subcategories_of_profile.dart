import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../login_create_forgot_screens_dir/reset_password_screen.dart';

class ProfileSubcategories extends StatelessWidget {
  const ProfileSubcategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            ConstantVariable.profile,
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResetPasswordScreen(
                    languageCode: '',
                  )));
            },
            child: const Text(
              "Change password",
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
              "Change profile image",
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
              "Change email",
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
              "Change mobile",
              style: TextStyle(
                  color: MyColors.facebookButtonColor,
                  fontSize: ConstantVariable.expandableListItemTvSize),
            ),
          )
        ],
      ),
    );
  }
}
