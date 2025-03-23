import 'dart:convert';

class RemarkModel {
  final String subject;
  final String teacher;
  final String date;
  final String content;
  final String type; // "Positive", "Negative", "Neutral"
  bool isExpanded;

  RemarkModel({
    required this.subject,
    required this.teacher,
    required this.date,
    required this.content,
    required this.type,
    this.isExpanded = false,
  });

  factory RemarkModel.fromJson(Map<String, dynamic> json) {
    return RemarkModel(
      subject: json['subject'],
      teacher: json['teacher'],
      date: json['date'],
      content: json['content'],
      type: json['type'],
      isExpanded: json['isExpanded'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'teacher': teacher,
      'date': date,
      'content': content,
      'type': type,
      'isExpanded': isExpanded,
    };
  }
}

// Helper functions for JSON conversion
List<RemarkModel> remarkModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return jsonData.map((e) => RemarkModel.fromJson(e)).toList();
}

String remarkModelToJson(List<RemarkModel> data) {
  final jsonData = data.map((e) => e.toJson()).toList();
  return json.encode(jsonData);
} 