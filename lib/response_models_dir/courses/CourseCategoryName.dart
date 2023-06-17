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