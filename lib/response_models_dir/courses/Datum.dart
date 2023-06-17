import 'CourseCategoryName.dart';

class Datum {
  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.courseCategoryName,
  });

  final int categoryId;
  final String categoryName;
  final List<CourseCategoryName> courseCategoryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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