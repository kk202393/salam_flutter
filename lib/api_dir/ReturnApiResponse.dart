import 'dart:convert';

import 'package:salam_flutter/api_dir/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:salam_flutter/constants/constant_variable/constant_variable.dart';
import 'dart:developer' as devtools show log;
import '../response_models_dir/all_courses_of_any_category/AllCoursesOfAnyCategory.dart';
import '../response_models_dir/course_details/course_detail.dart';
import '../response_models_dir/courses/HomeDashboardResponse.dart';
import '../response_models_dir/courses/HomePageSearchResponse.dart';
import '../response_models_dir/login_response/LoginResponse.dart';

class ReturnApisResponse {
  Future<dynamic> login(Map body) async {
    String jsonString = jsonEncode(body);
    try {
      final response = await http.post(
          Uri.parse(
            ApiUrl.login_api,
          ),
          headers: {
            ConstantVariable.access_token: ConstantVariable.access_token_value,
            ConstantVariable.refresh_token:
                ConstantVariable.refresh_token_value,
            ConstantVariable.jwtToken: ConstantVariable.jwtToken_value
          },
          body: jsonString);
      var data = jsonDecode(response.body.toString());
      // var data1 = data['data'];
      // devtools.log(data["data"]["userFirstName"]);
      // devtools.log('login_A: ${jsonDecode(response.body.toString())}');
      devtools.log('login_B: ${data['data'][0]['id']}');
      // devtools.log('login_B: ${jsonDecode(response.body)}');
      // return UserLoginResponse.fromJson(jsonDecode(response.body.toString()));
      return UserLoginResponse(
        msg: data["msg"],
        status: data["status"],
        success: true,
        data: Data(
            userFirstName: "userFirstName",
            userLastName: "userLastName",
            userId: data['data'][0]['id'] ? data['data'][0]['id'] : 0,
            email: "email",
            isStaff: true),
      );
    } catch (err) {
      return 404;
    }
  }

  Future<dynamic> dashboard(Map body) async {
    try {
      final response = await http.post(
          Uri.parse(
            ApiUrl.dashboard_api,
          ),
          headers: {
            ConstantVariable.access_token: ConstantVariable.access_token_value,
            ConstantVariable.refresh_token:
                ConstantVariable.refresh_token_value,
            ConstantVariable.jwtToken: ConstantVariable.jwtToken_value
          },
          body: body);
      print('dashboard: ${body.toString()}');
      print('dashboard: ${response.statusCode}');
      print('dashboard: ${response.body.toString()}');

      return HomeDashboardResponse.fromJson(
          jsonDecode(response.body.toString()));
    } catch (err) {
      return 404;
    }
  }

  Future<dynamic> getHomeCourseSearch(String query) async {
    try {
      var url = ApiUrl.courses_search_api + query;
      final response = await http.get(Uri.parse(url));
      print('getHomeCourseSearch: ${response.statusCode}');
      print('getHomeCourseSearch: ${query}');

      if (response.statusCode == 200) {
        print('getHomeCourseSearch: ${response.body.toString()}');
        return HomePageSearchResponse.fromJson(
            jsonDecode(response.body.toString()));
      } else {
        return response.statusCode;
      }
    } catch (err) {
      print('getHomeCourseSearch: ${err}');
      return 404;
    }
  }

  Future<dynamic> courseDetail(Map body) async {
    try {
      final response = await http.post(
          Uri.parse(
            ApiUrl.courseDetails_api,
          ),
          headers: {
            ConstantVariable.access_token: ConstantVariable.access_token_value,
            ConstantVariable.refresh_token:
                ConstantVariable.refresh_token_value,
            ConstantVariable.jwtToken: ConstantVariable.jwtToken_value
          },
          body: body);

      print('courseDetail: ${response.statusCode}');
      print('courseDetail: ${response.body.toString()}');

      return CourseDetailsResponse.fromJson(
          jsonDecode(response.body.toString()));
    } catch (err) {
      return err;
    }
  }

  Future<dynamic> coursesListOfAnyCategory(Map body) async {
    try {
      final response = await http.post(
          Uri.parse(
            ApiUrl.categoryCourses_api,
          ),
          body: body);

      print('coursesListOfAnyCategory: ${response.statusCode}');
      print('coursesListOfAnyCategory: ${response.body.toString()}');
      print('coursesListOfAnyCategory: ${body.toString()}');

      return AllCoursesOfAnyCategory.fromJson(
          jsonDecode(response.body.toString()));
    } catch (err) {
      return 404;
    }
  }
}








// Future<dynamic> getHomeCourses() async {
//   try {
//     final response = await http.get(Uri.parse(ApiUrl.courses_api));
//     print('getHomeCourses: ${response.statusCode}');
//
//     if(response.statusCode==200){
//        print('getHomeCourses: ${response.body.toString()}');
//       return HomeCourseList.fromJson(jsonDecode(response.body.toString()));
//     }
//     else{
//       return response.statusCode;
//     }
//
//   } catch (err) {
//     print('getHomeCourses: ${err}');
//     return err;
//   }
// }


// Future<dynamic> search1() async {
//   try {
//     Map toMap() {
//       var map = new Map();
//       map["search"] = 'a';
//       return map;
//     }
//     final response = await http.post(Uri.parse(ApiUrl.search1,)
//         ,headers: {
//           ConstantVariable.access_token: ConstantVariable.access_token_value,
//           ConstantVariable.refresh_token: ConstantVariable.refresh_token_value,
//           ConstantVariable.jwtToken: ConstantVariable.jwtToken_value
//         }
//         , body: toMap());
//     print('search1: ${response.statusCode}');
//     print('search1: ${response.body.toString()}');
//
//     return Search1Res.fromJson(jsonDecode(response.body.toString()));
//
//   } catch (err) {
//     return err;
//   }
// }