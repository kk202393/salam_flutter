// To parse this JSON data, do
//
//     final courseDetailsResponse = courseDetailsResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CourseDetailsResponse courseDetailsResponseFromJson(String str) => CourseDetailsResponse.fromJson(json.decode(str));

String courseDetailsResponseToJson(CourseDetailsResponse data) => json.encode(data.toJson());

class CourseDetailsResponse {
  CourseDetailsResponse({
    required this.success,
    required this.courseDetailData,
    required this.errorMsg,
  });

  final int success;
  final CourseDetailData courseDetailData;
  final String errorMsg;

  factory CourseDetailsResponse.fromJson(Map<String, dynamic> json) => CourseDetailsResponse(
    success: json["success"],
    courseDetailData: CourseDetailData.fromJson(json["course_Detail_data"]),
    errorMsg: json["error_msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "course_Detail_data": courseDetailData.toJson(),
    "error_msg": errorMsg,
  };
}

class CourseDetailData {
  CourseDetailData({
    required this.id,
    required this.displayName,
    required this.categoryType,
    required this.startDate,
    required this.endDate,
    required this.announcement,
    required this.courseVideoUrl,
    required this.courseImageUrl,
    required this.enrollmentStart,
    required this.enrollmentEnd,
  });

  final dynamic id;
  final dynamic displayName;
  final dynamic categoryType;
  final dynamic startDate;
  final dynamic endDate;
  final dynamic announcement;
  final dynamic courseVideoUrl;
  final dynamic courseImageUrl;
  final dynamic enrollmentStart;
  final dynamic enrollmentEnd;

  factory CourseDetailData.fromJson(Map<String, dynamic> json) => CourseDetailData(
    id: json["id"],
    displayName: json["display_name"],
    categoryType: json["category_type"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    announcement: json["announcement"],
    courseVideoUrl: json["course_video_url"],
    courseImageUrl: json["course_image_url"],
    enrollmentStart: json["enrollment_start"],
    enrollmentEnd: json["enrollment_end"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_name": displayName,
    "category_type": categoryType,
    "start_date": startDate,
    "end_date": endDate,
    "announcement": announcement,
    "course_video_url": courseVideoUrl,
    "course_image_url": courseImageUrl,
    "enrollment_start": enrollmentStart,
    "enrollment_end": enrollmentEnd,
  };
}
