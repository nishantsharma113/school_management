import 'dart:convert';

List<SchoolTimingModel> schoolTimingModelFromJson(String str) => 
    List<SchoolTimingModel>.from(json.decode(str).map((x) => SchoolTimingModel.fromJson(x)));

String schoolTimingModelToJson(List<SchoolTimingModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolTimingModel {
  String day;
  List<TimeSlotModel> timeSlots;
  bool isExpanded;

  SchoolTimingModel({
    required this.day,
    required this.timeSlots,
    this.isExpanded = false,
  });

  factory SchoolTimingModel.fromJson(Map<String, dynamic> json) => SchoolTimingModel(
    day: json["day"],
    timeSlots: List<TimeSlotModel>.from(json["timeSlots"].map((x) => TimeSlotModel.fromJson(x))),
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "timeSlots": List<dynamic>.from(timeSlots.map((x) => x.toJson())),
    "isExpanded": isExpanded,
  };
}

class TimeSlotModel {
  String startTime;
  String endTime;
  String activity;
  String description;
  bool isBreak;

  TimeSlotModel({
    required this.startTime,
    required this.endTime,
    required this.activity,
    required this.description,
    this.isBreak = false,
  });

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => TimeSlotModel(
    startTime: json["startTime"],
    endTime: json["endTime"],
    activity: json["activity"],
    description: json["description"],
    isBreak: json["isBreak"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "startTime": startTime,
    "endTime": endTime,
    "activity": activity,
    "description": description,
    "isBreak": isBreak,
  };
} 