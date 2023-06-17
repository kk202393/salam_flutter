import 'package:flutter/material.dart';

import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import 'login_screen.dart';


class CreateNewAccountScreen extends StatefulWidget {
  final String languageCode;

  const CreateNewAccountScreen({
    required this.languageCode,
  });

  @override
  State<CreateNewAccountScreen> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccountScreen> {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                child: Text(ConstantVariable.createNewAccount,style:
                TextStyle(color: MyColors.black,fontSize: 20),),
              ),
          Padding(
            padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  <Widget>[
                Flexible(
                  child: TextField(
                    style: ConstantMethods.textStyle(),
                    controller: firstNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                        hintText: 'Enter first name'),
                  ),
                ),
                const SizedBox(width: 20.0,),
                 Flexible(

                  child: TextField(
                    style: ConstantMethods.textStyle(),
                    controller: lastNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                        hintText: 'Enter last name'),
                  ),
                ),

              ],
            ),
          ),
              Padding(
                padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
                child: TextField(
                  style: ConstantMethods.textStyle(),
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeTopMargin, ConstantVariable.homeItemsLeftRightMargin, 10),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  style: ConstantMethods.textStyle(),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeTopMargin, ConstantVariable.homeItemsLeftRightMargin, 10),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  style: ConstantMethods.textStyle(),
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Enter confirm password'),
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
                    onPressed: () {},
                    child:  Ink(
                      decoration: BoxDecoration(
                          gradient:
                          const LinearGradient(colors: [MyColors.loginButtonColor_a, MyColors.loginButtonColor_b, MyColors.loginButtonColor_c, MyColors.loginButtonColor_d]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(

                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(ConstantVariable.createNewAccountPlus,style:
                        TextStyle(color: MyColors.white,fontSize: 20),),
                      ),
                    ),

                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin_2, 0, ConstantVariable.homeItemsLeftRightMargin_2, ConstantVariable.homeBottomMargin),
                child: TextButton(
                  child: const Text(
                    ConstantVariable.alreadyHaveAnAccount,
                    style: TextStyle(fontSize: 15,color: MyColors.black),
                  ),
                  onPressed: () {
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(languageCode: '',)));
                    Navigator.pop(context);
                    //signup screen
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeTopMargin, ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.googleButtonColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child:  const Text(ConstantVariable.google,style:
                    TextStyle(color: MyColors.white,fontSize: 20),),

                  )
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeTopMargin, ConstantVariable.homeItemsLeftRightMargin, ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.facebookButtonColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child:  const Text(ConstantVariable.facebook,style:
                    TextStyle(color: MyColors.white,fontSize: 20),),

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
