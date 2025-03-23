import 'dart:convert';

List<SyllabusModel> syllabusModelFromJson(String str) => 
    List<SyllabusModel>.from(json.decode(str).map((x) => SyllabusModel.fromJson(x)));

String syllabusModelToJson(List<SyllabusModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusModel {
  String subject;
  String teacher;
  List<UnitModel> units;
  bool isExpanded;

  SyllabusModel({
    required this.subject,
    required this.teacher,
    required this.units,
    this.isExpanded = false,
  });

  factory SyllabusModel.fromJson(Map<String, dynamic> json) => SyllabusModel(
    subject: json["subject"],
    teacher: json["teacher"],
    units: List<UnitModel>.from(json["units"].map((x) => UnitModel.fromJson(x))),
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "teacher": teacher,
    "units": List<dynamic>.from(units.map((x) => x.toJson())),
    "isExpanded": isExpanded,
  };
}

class UnitModel {
  String title;
  List<String> topics;
  bool isCompleted;

  UnitModel({
    required this.title,
    required this.topics,
    required this.isCompleted,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
    title: json["title"],
    topics: List<String>.from(json["topics"].map((x) => x)),
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "topics": List<dynamic>.from(topics.map((x) => x)),
    "isCompleted": isCompleted,
  };
} 