import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';

 class PaymentOptions extends StatelessWidget {
   const PaymentOptions({Key? key}) : super(key: key);

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
             "Payment",
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
               "Paypal",
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
             onPressed: () {

             },
             child: const Text(
               "Debit card",
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
             onPressed: () {

             },
             child: const Text(
               "Credit card",
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
             onPressed: () {

             },
             child: const Text(
               "Other",
               style: TextStyle(
                   color: MyColors.facebookButtonColor,
                   fontSize: ConstantVariable.expandableListItemTvSize),
             ),
           ),

         ],
       ),
     );
   }
 }
