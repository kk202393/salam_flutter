import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import '../../api_dir/ReturnApiResponse.dart';
import '../../constants/colors_dir/Colors.dart';
import '../../constants/constant_variable/constant_variable.dart';
import '../../constants/constant_widgets_dir/CustomWidget.dart';
import '../../response_models_dir/login_response/LoginResponse.dart';
import '../home_screen_dir/home_scren.dart';
import 'create_account_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  final String languageCode;

  const LoginScreen({
    required this.languageCode,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmailValid = false;
  bool isPasswordValid = false;

  late Future<dynamic> futureAlbum;
  late UserLoginResponse loginResponse;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isInAsyncCall = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
    setState(() {
      try {
        print('login_A:' + " =initState =  ");
      } catch (e) {}
    });
    super.initState();
  }

  void _submit(BuildContext context) {
    print('login_A:' + " =_submit_run =  ");
    FocusScope.of(context).requestFocus(new FocusNode());
    final _accountUsername = emailController.value.text;
    final _accountPassword = passwordController.value.text;

    if (_accountUsername.isEmpty || _accountPassword.isEmpty) {
      if (_accountUsername.isEmpty) {
        ConstantMethods.showSnackBar(context, "Email cannot be empty");
      } else {
        ConstantMethods.showSnackBar(context, "Password cannot be empty");
      }
    } else {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }

      setState(() {
        _isInAsyncCall = true;
      });
      // Simulate a service call
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          // stop the modal progress HUD
          _isInAsyncCall = false;
        });
        Map toMap() {
          var map = new Map();
          map["username"] = _accountUsername;
          map["password"] = _accountPassword;
          return map;
        }

        futureAlbum = ReturnApisResponse().login(toMap());
        futureAlbum.catchError(
          (onError) {
            ConstantMethods.showSnackBar(context, "Please try again");
          },
        ).then((value) {
          loginResponse = value;
          if (loginResponse == null && (loginResponse.success == true)) {
            ConstantMethods.showSnackBar(context, "No data found");
          }
        }).whenComplete(() {
          //ConstantMethods.showSnackBar(context, loginResponse.msg);
          devtools.log("function called $loginResponse");
          if ((loginResponse != null) && (loginResponse.status == 200)) {
            print('login_A:' +
                " =loginResponse_is =  " +
                loginResponse.success.toString());
            _setLoggedIn(loginResponse);
          } else {
            ConstantMethods.showSnackBar(context, loginResponse.msg);
          }
        });
      });
    }
  }

  _setLoggedIn(UserLoginResponse detail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ConstantVariable.isUserLoggedIn, true);

    prefs.setString(ConstantVariable.userData, json.encode(detail.data));
    //  print("initStateParam" +" encodedMap = "+detail.data.email + " staff = "+detail.data.isStaff.toString());

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen("NA")),
      (Route<dynamic> route) => false,
    );
  }

  String? get _emailErrorText {
    final text = emailController.value.text;
    print(text);
    if (text.length > 0) {
      if (text.length < 1) {
        return 'Too short';
      }
      // if (!text.contains("@")) {
      //   return 'Invalid Email';
      // }
    }
    return null;
  }

  String? get _passwordErrorText {
    final text = passwordController.value.text;

    if (text.length >= 1) {
      if (text.length < 4) {
        return 'Too short password';
      }
    }

    return null;
  }

  Widget buildLoginForm(BuildContext context) {
    var _text = '';
    var _text2 = '';
    _formKey.currentState?.validate();
    return Form(
        key: this._formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email Id',
                    errorText: _emailErrorText),
                onChanged: (text) => setState(() => _text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  ConstantVariable.homeItemsLeftRightMargin, 10, 20, 10),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    errorText: _passwordErrorText),
                onChanged: (text) => setState(() => _text2),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 200,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                    ConstantVariable.homeItemsLeftRightMargin, 0, 0, 0),
                child: Text(
                  "Login",
                  style: TextStyle(color: MyColors.black, fontSize: 20),
                ),
              ),

              buildLoginForm(context),

              Container(
                  padding: const EdgeInsets.fromLTRB(
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeTopMargin,
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      if (_emailErrorText == null &&
                          _passwordErrorText == null) {
                        _submit(context);
                      } else {
                        ConstantMethods.showSnackBar(
                            context, "Please Enter Credentials");
                      }
                    },
                    // onPressed: (_emailErrorText==null && _passwordErrorText==null) ?  _setLoggedIn
                    // onPressed:
                    //     (_emailErrorText == null && _passwordErrorText == null)
                    //         ? _submit(context)
                    //         : null,
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            MyColors.loginButtonColor_a,
                            MyColors.loginButtonColor_b,
                            MyColors.loginButtonColor_c,
                            MyColors.loginButtonColor_d
                          ]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: _isInAsyncCall
                            ? SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: MyColors.white, fontSize: 20),
                              ),
                      ),
                    ),
                  )),
              // child: ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.zero,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     elevation: 5,
              //     minimumSize: const Size.fromHeight(50), // NEW
              //   ),
              //  // onPressed: (_emailErrorText==null && _passwordErrorText==null) ?  _setLoggedIn
              //   onPressed: (_emailErrorText==null && _passwordErrorText==null) ?  _submit
              //
              //       : null,
              //   child: Ink(
              //     decoration: BoxDecoration(
              //         gradient: const LinearGradient(colors: [
              //           MyColors.loginButtonColor_a,
              //           MyColors.loginButtonColor_b,
              //           MyColors.loginButtonColor_c,
              //           MyColors.loginButtonColor_d
              //         ]),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: Container(
              //       height: 50,
              //       alignment: Alignment.center,
              //       child: const Text(
              //         "LOGIN",
              //         style: TextStyle(
              //             color: MyColors.white, fontSize: 20),
              //       ),
              //     ),
              //   ),
              // )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        0,
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        ConstantVariable.homeBottomMargin),
                    child: TextButton(
                      child: const Text(
                        ConstantVariable.createNewAccount,
                        style: TextStyle(fontSize: 14, color: MyColors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateNewAccountScreen(
                                  languageCode: '',
                                )));
                        //signup screen
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        0,
                        ConstantVariable.homeItemsLeftRightMargin_2,
                        ConstantVariable.homeBottomMargin),
                    child: TextButton(
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontSize: 14, color: MyColors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen(
                                  languageCode: '',
                                )));
                        //signup screen
                      },
                    ),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeTopMargin,
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.googleButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      ConstantVariable.google,
                      style: TextStyle(color: MyColors.white, fontSize: 20),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeTopMargin,
                      ConstantVariable.homeItemsLeftRightMargin,
                      ConstantVariable.homeBottomMargin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.facebookButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      ConstantVariable.facebook,
                      style: TextStyle(color: MyColors.white, fontSize: 20),
                    ),
                  )),
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
