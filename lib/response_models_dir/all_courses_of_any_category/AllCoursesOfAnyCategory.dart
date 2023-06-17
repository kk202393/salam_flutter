// To parse this JSON data, do
//
//     final allCoursesOfAnyCategory = allCoursesOfAnyCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllCoursesOfAnyCategory allCoursesOfAnyCategoryFromJson(String str) => AllCoursesOfAnyCategory.fromJson(json.decode(str));

String allCoursesOfAnyCategoryToJson(AllCoursesOfAnyCategory data) => json.encode(data.toJson());

class AllCoursesOfAnyCategory {
  AllCoursesOfAnyCategory({
    required this.success,
    required this.data,
    required this.errorMsg,
  });

  final int success;
  final List<DataA> data;
  final String errorMsg;

  factory AllCoursesOfAnyCategory.fromJson(Map<String, dynamic> json) => AllCoursesOfAnyCategory(
    success: json["success"],
    data: List<DataA>.from(json["data"].map((x) => DataA.fromJson(x))),
    errorMsg: json["error_msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error_msg": errorMsg,
  };
}

class DataA {
  DataA({
    required this.categoryId,
    required this.categoryName,
    required this.courseCategoryName,
  });

  final int categoryId;
  final String categoryName;
  final List<CourseCategoryName> courseCategoryName;

  factory DataA.fromJson(Map<String, dynamic> json) => DataA(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    courseCategoryName: List<CourseCategoryName>.from(json["course_category_name"].map((x) => CourseCategoryName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "course_category_name": List<dynamic>.from(courseCategoryName.map((x) => x.toJson())),
  };
}

class CourseCategoryName {
  CourseCategoryName({
    required this.id,
    required this.displayName,
    required this.courseImageUrl,
    required this.categoryType,
    required this.startDate,
    required this.endDate,
    required this.announcement,
    required this.courseVideoUrl,
    required this.enrollmentStart,
    required this.enrollmentEnd,
  });

  final String id;
  final String displayName;
  final String courseImageUrl;
  final int categoryType;
  final DateTime startDate;
  final dynamic endDate;
  final dynamic announcement;
  final dynamic courseVideoUrl;
  final dynamic enrollmentStart;
  final dynamic enrollmentEnd;

  factory CourseCategoryName.fromJson(Map<String, dynamic> json) => CourseCategoryName(
    id: json["id"],
    displayName: json["display_name"],
    courseImageUrl: json["course_image_url"],
    categoryType: json["category_type"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
    announcement: json["announcement"],
    courseVideoUrl: json["course_video_url"],
    enrollmentStart: json["enrollment_start"],
    enrollmentEnd: json["enrollment_end"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_name": displayName,
    "course_image_url": courseImageUrl,
    "category_type": categoryType,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate,
    "announcement": announcement,
    "course_video_url": courseVideoUrl,
    "enrollment_start": enrollmentStart,
    "enrollment_end": enrollmentEnd,
  };
}
