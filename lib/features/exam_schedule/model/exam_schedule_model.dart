import 'dart:convert';

class ExamScheduleModel {
  final String date;
  final String day;
  final List<ExamModel> exams;
  bool isExpanded;

  ExamScheduleModel({
    required this.date,
    required this.day,
    required this.exams,
    this.isExpanded = false,
  });

  factory ExamScheduleModel.fromJson(Map<String, dynamic> json) {
    return ExamScheduleModel(
      date: json['date'],
      day: json['day'],
      exams: List<ExamModel>.from(
        json['exams']?.map((x) => ExamModel.fromJson(x)) ?? [],
      ),
      isExpanded: json['isExpanded'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day,
      'exams': exams.map((x) => x.toJson()).toList(),
      'isExpanded': isExpanded,
    };
  }
}

class ExamModel {
  final String subject;
  final String time;
  final String venue;
  final String duration;
  final String examType; // e.g., 'Theory', 'Practical', 'Oral'

  ExamModel({
    required this.subject,
    required this.time,
    required this.venue,
    required this.duration,
    required this.examType,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      subject: json['subject'],
      time: json['time'],
      venue: json['venue'],
      duration: json['duration'],
      examType: json['examType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'time': time,
      'venue': venue,
      'duration': duration,
      'examType': examType,
    };
  }
}

// Helper function to convert JSON string to ExamScheduleModel list
List<ExamScheduleModel> examScheduleModelFromJson(String str) {
  final List<dynamic> jsonList = json.decode(str);
  return jsonList.map((x) => ExamScheduleModel.fromJson(x)).toList();
}

// Helper function to convert ExamScheduleModel list to JSON string
String examScheduleModelToJson(List<ExamScheduleModel> data) {
  final List<Map<String, dynamic>> jsonList = data.map((x) => x.toJson()).toList();
  return json.encode(jsonList);
} 