import 'dart:convert';

// To parse this JSON data, do
//
//     final homeCourseList = homeCourseListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final homeCourseList = homeCourseListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final homeCourseList = homeCourseListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'Datum.dart';

HomeCourseList homeCourseListFromJson(String str) => HomeCourseList.fromJson(json.decode(str));

String homeCourseListToJson(HomeCourseList data) => json.encode(data.toJson());

class HomeCourseList {
  HomeCourseList({
    required this.success,
    required this.data,
    required this.errorMsg,
  });

  final int success;
  final List<Datum> data;
  final String errorMsg;

  factory HomeCourseList.fromJson(Map<String, dynamic> json) => HomeCourseList(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errorMsg: json["error_msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error_msg": errorMsg,
  };
}

