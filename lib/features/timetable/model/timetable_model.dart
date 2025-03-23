import 'dart:convert';

List<TimetableModel> timetableModelFromJson(String str) => 
    List<TimetableModel>.from(json.decode(str).map((x) => TimetableModel.fromJson(x)));

String timetableModelToJson(List<TimetableModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimetableModel {
  String day;
  List<PeriodModel> periods;
  bool isExpanded;

  TimetableModel({
    required this.day,
    required this.periods,
    this.isExpanded = false,
  });

  factory TimetableModel.fromJson(Map<String, dynamic> json) => TimetableModel(
    day: json["day"],
    periods: List<PeriodModel>.from(json["periods"].map((x) => PeriodModel.fromJson(x))),
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "periods": List<dynamic>.from(periods.map((x) => x.toJson())),
    "isExpanded": isExpanded,
  };
}

class PeriodModel {
  String subject;
  String time;
  String teacher;
  String periodType; // "class", "break", "lunch", etc.

  PeriodModel({
    required this.subject,
    required this.time,
    required this.teacher,
    required this.periodType,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) => PeriodModel(
    subject: json["subject"],
    time: json["time"],
    teacher: json["teacher"],
    periodType: json["periodType"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "time": time,
    "teacher": teacher,
    "periodType": periodType,
  };
} 