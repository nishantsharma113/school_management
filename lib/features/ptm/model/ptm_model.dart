import 'dart:convert';

List<PTMModel> ptmModelFromJson(String str) =>
    List<PTMModel>.from(json.decode(str).map((x) => PTMModel.fromJson(x)));

String ptmModelToJson(List<PTMModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PTMModel {
  final String id;
  final String teacherName;
  final String subject;
  final String date;
  final String time;
  final String venue;
  final PTMStatus status;
  final String? notes;
  final bool isExpanded;

  PTMModel({
    required this.id,
    required this.teacherName,
    required this.subject,
    required this.date,
    required this.time,
    required this.venue,
    required this.status,
    this.notes,
    this.isExpanded = false,
  });

  PTMModel copyWith({
    String? id,
    String? teacherName,
    String? subject,
    String? date,
    String? time,
    String? venue,
    PTMStatus? status,
    String? notes,
    bool? isExpanded,
  }) =>
      PTMModel(
        id: id ?? this.id,
        teacherName: teacherName ?? this.teacherName,
        subject: subject ?? this.subject,
        date: date ?? this.date,
        time: time ?? this.time,
        venue: venue ?? this.venue,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  factory PTMModel.fromJson(Map<String, dynamic> json) => PTMModel(
        id: json["id"],
        teacherName: json["teacherName"],
        subject: json["subject"],
        date: json["date"],
        time: json["time"],
        venue: json["venue"],
        status: ptmStatusFromString(json["status"]),
        notes: json["notes"],
        isExpanded: json["isExpanded"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacherName": teacherName,
        "subject": subject,
        "date": date,
        "time": time,
        "venue": venue,
        "status": ptmStatusToString(status),
        "notes": notes,
        "isExpanded": isExpanded,
      };
}

enum PTMStatus {
  upcoming,
  completed,
  cancelled
}

String ptmStatusToString(PTMStatus status) {
  switch (status) {
    case PTMStatus.upcoming:
      return "upcoming";
    case PTMStatus.completed:
      return "completed";
    case PTMStatus.cancelled:
      return "cancelled";
  }
}

PTMStatus ptmStatusFromString(String status) {
  switch (status) {
    case "upcoming":
      return PTMStatus.upcoming;
    case "completed":
      return PTMStatus.completed;
    case "cancelled":
      return PTMStatus.cancelled;
    default:
      return PTMStatus.upcoming;
  }
} 