// To parse this JSON data, do
//
//     final homeDashboardResponse = homeDashboardResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'CourseCategoryName.dart';
import 'Datum.dart';

HomeDashboardResponse homeDashboardResponseFromJson(String str) => HomeDashboardResponse.fromJson(json.decode(str));

String homeDashboardResponseToJson(HomeDashboardResponse data) => json.encode(data.toJson());

class HomeDashboardResponse {
  HomeDashboardResponse({
    required this.success,
    required this.studentCourseData,
    required this.dashboardData,
    required this.errorMsg,
  });

  final int success;
  final List<List<CourseCategoryName>> studentCourseData;
  final List<Datum> dashboardData;
  final String errorMsg;

  factory HomeDashboardResponse.fromJson(Map<String, dynamic> json) => HomeDashboardResponse(
    success: json["success"],
    studentCourseData: List<List<CourseCategoryName>>.from(json["student_course_data"].map((x) => List<CourseCategoryName>.from(x.map((x) => CourseCategoryName.fromJson(x))))),
    dashboardData: List<Datum>.from(json["dashboard_data"].map((x) => Datum.fromJson(x))),
    errorMsg: json["error_msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "student_course_data": List<dynamic>.from(studentCourseData.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "dashboard_data": List<dynamic>.from(dashboardData.map((x) => x.toJson())),
    "error_msg": errorMsg,
  };
}

