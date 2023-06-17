
import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final String languageCode;

  const ForgetPasswordScreen({
    required this.languageCode,
  });

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  TextEditingController forgetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              const Padding(
                padding: EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, 0, 0, 0),
                child: Text("Forget Password",style:
                TextStyle(color: MyColors.black,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
                child: TextField(
                  style: ConstantMethods.textStyle(),
                  controller: forgetPasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Username'),
                ),
              ),


              Container(
                  padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeTopMargin, ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {

                    },
                    child:  Ink(
                      decoration: BoxDecoration(
                          gradient:
                          const LinearGradient(colors: [MyColors.loginButtonColor_a, MyColors.loginButtonColor_b, MyColors.loginButtonColor_c, MyColors.loginButtonColor_d]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(

                        height: 50,
                        alignment: Alignment.center,
                        child: const Text("Forget Password",style:
                        TextStyle(color: MyColors.white,fontSize: 20),),
                      ),
                    ),

                  )
              ),

              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}