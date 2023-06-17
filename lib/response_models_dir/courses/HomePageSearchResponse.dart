// To parse this JSON data, do
//
//     final homePageSearchResponse = homePageSearchResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomePageSearchResponse homePageSearchResponseFromJson(String str) => HomePageSearchResponse.fromJson(json.decode(str));

String homePageSearchResponseToJson(HomePageSearchResponse data) => json.encode(data.toJson());

class HomePageSearchResponse {
  HomePageSearchResponse({
    required this.next,
    required this.previous,
    required this.count,
    required this.numPages,
    required this.currentPage,
    required this.start,
    required this.results,
  });

  final dynamic next;
  final dynamic previous;
  final int count;
  final int numPages;
  final int currentPage;
  final int start;
  final List<Result> results;

  factory HomePageSearchResponse.fromJson(Map<String, dynamic> json) => HomePageSearchResponse(
    next: json["next"],
    previous: json["previous"],
    count: json["count"],
    numPages: json["num_pages"],
    currentPage: json["current_page"],
    start: json["start"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
    "count": count,
    "num_pages": numPages,
    "current_page": currentPage,
    "start": start,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.categoryId,
    required this.categoryName,
    required this.courseCategoryName,
  });

  final int categoryId;
  final String categoryName;
  final List<CourseCategoryName> courseCategoryName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
  });

  final String id;
  final String displayName;
  final String courseImageUrl;
  final int categoryType;

  factory CourseCategoryName.fromJson(Map<String, dynamic> json) => CourseCategoryName(
    id: json["id"],
    displayName: json["display_name"],
    courseImageUrl: json["course_image_url"],
    categoryType: json["category_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_name": displayName,
    "course_image_url": courseImageUrl,
    "category_type": categoryType,
  };
}
