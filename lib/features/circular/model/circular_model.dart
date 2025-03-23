import 'dart:convert';

List<CircularModel> circularModelFromJson(String str) =>
    List<CircularModel>.from(json.decode(str).map((x) => CircularModel.fromJson(x)));

String circularModelToJson(List<CircularModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CircularModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String issuedBy;
  final String category;
  final bool isImportant;
  final bool isRead;
  final String? attachmentUrl;
  final bool isExpanded;

  CircularModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.issuedBy,
    required this.category,
    this.isImportant = false,
    this.isRead = false,
    this.attachmentUrl,
    this.isExpanded = false,
  });

  CircularModel copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? issuedBy,
    String? category,
    bool? isImportant,
    bool? isRead,
    String? attachmentUrl,
    bool? isExpanded,
  }) =>
      CircularModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        issuedBy: issuedBy ?? this.issuedBy,
        category: category ?? this.category,
        isImportant: isImportant ?? this.isImportant,
        isRead: isRead ?? this.isRead,
        attachmentUrl: attachmentUrl ?? this.attachmentUrl,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  factory CircularModel.fromJson(Map<String, dynamic> json) => CircularModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        issuedBy: json["issuedBy"],
        category: json["category"],
        isImportant: json["isImportant"] ?? false,
        isRead: json["isRead"] ?? false,
        attachmentUrl: json["attachmentUrl"],
        isExpanded: json["isExpanded"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date,
        "issuedBy": issuedBy,
        "category": category,
        "isImportant": isImportant,
        "isRead": isRead,
        "attachmentUrl": attachmentUrl,
        "isExpanded": isExpanded,
      };
} 