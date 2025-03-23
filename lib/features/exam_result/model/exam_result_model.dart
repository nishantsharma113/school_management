import 'dart:convert';

List<ExamResultModel> examResultModelFromJson(String str) => 
    List<ExamResultModel>.from(json.decode(str).map((x) => ExamResultModel.fromJson(x)));

String examResultModelToJson(List<ExamResultModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamResultModel {
  String examType;
  String examDate;
  double totalMarks;
  double obtainedMarks;
  String grade;
  List<SubjectResultModel> subjects;
  bool isExpanded;

  ExamResultModel({
    required this.examType,
    required this.examDate,
    required this.totalMarks,
    required this.obtainedMarks,
    required this.grade,
    required this.subjects,
    this.isExpanded = false,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) => ExamResultModel(
    examType: json["examType"],
    examDate: json["examDate"],
    totalMarks: json["totalMarks"].toDouble(),
    obtainedMarks: json["obtainedMarks"].toDouble(),
    grade: json["grade"],
    subjects: List<SubjectResultModel>.from(json["subjects"].map((x) => SubjectResultModel.fromJson(x))),
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "examType": examType,
    "examDate": examDate,
    "totalMarks": totalMarks,
    "obtainedMarks": obtainedMarks,
    "grade": grade,
    "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
    "isExpanded": isExpanded,
  };
}

class SubjectResultModel {
  String subject;
  double maxMarks;
  double obtainedMarks;
  String grade;
  String teacherComment;

  SubjectResultModel({
    required this.subject,
    required this.maxMarks,
    required this.obtainedMarks,
    required this.grade,
    required this.teacherComment,
  });

  factory SubjectResultModel.fromJson(Map<String, dynamic> json) => SubjectResultModel(
    subject: json["subject"],
    maxMarks: json["maxMarks"].toDouble(),
    obtainedMarks: json["obtainedMarks"].toDouble(),
    grade: json["grade"],
    teacherComment: json["teacherComment"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "maxMarks": maxMarks,
    "obtainedMarks": obtainedMarks,
    "grade": grade,
    "teacherComment": teacherComment,
  };
} 