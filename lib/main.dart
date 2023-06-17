import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/home_screen_dir/home_scren.dart';
import 'package:salam_flutter/user_vendor_common_screens_dir/login_create_forgot_screens_dir/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'GetStartedScreen.dart';
import 'constants/constant_variable/constant_variable.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // if (ResponsiveHelper.isMobilePhone()) {
  //   HttpOverrides.global = new MyHttpOverrides();
  // }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  bool? isUserLoggedIn = prefs.getBool(ConstantVariable.isUserLoggedIn);
  bool? isGetStartScreenLaunchedBefore =
      prefs.getBool(ConstantVariable.isGetStartScreenLaunchedBefore);

  if (isUserLoggedIn == null || isUserLoggedIn == false) {
    if (isGetStartScreenLaunchedBefore == null ||
        isGetStartScreenLaunchedBefore == false) {
      runApp(MyApp(screenName: ConstantVariable.getStart));
    } else {
      runApp(MyApp(screenName: ConstantVariable.loginScreen));
    }
  } else {
    runApp(MyApp(screenName: ConstantVariable.homeScreen));
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String screenName;

  MyApp({required this.screenName});

  Widget returnScreen() {
    if (screenName == ConstantVariable.getStart)
      return GetStartedScreen();
    else if (screenName == ConstantVariable.loginScreen)
      return LoginScreen(languageCode: "");
    else
      return HomeScreen("NA");
  }

  //This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salam main',
      // home: EmpCls(),
      debugShowCheckedModeBanner: false,
      home: returnScreen(),
      //home: isUserLoggedIn ? HomeScreen(languageCode: "") : LoginScreen(languageCode: ""),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
