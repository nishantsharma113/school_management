import 'dart:convert';
import 'package:flutter/material.dart';

List<HolidayEventModel> holidayEventModelFromJson(String str) =>
    List<HolidayEventModel>.from(json.decode(str).map((x) => HolidayEventModel.fromJson(x)));

String holidayEventModelToJson(List<HolidayEventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HolidayEventModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final bool isHoliday;
  final EventType type;
  final bool isExpanded;

  HolidayEventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    required this.isHoliday,
    required this.type,
    this.isExpanded = false,
  });

  HolidayEventModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    String? imageUrl,
    bool? isHoliday,
    EventType? type,
    bool? isExpanded,
  }) =>
      HolidayEventModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        imageUrl: imageUrl ?? this.imageUrl,
        isHoliday: isHoliday ?? this.isHoliday,
        type: type ?? this.type,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  factory HolidayEventModel.fromJson(Map<String, dynamic> json) => HolidayEventModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["imageUrl"],
        isHoliday: json["isHoliday"],
        type: EventType.values[json["type"]],
        isExpanded: json["isExpanded"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
        "imageUrl": imageUrl,
        "isHoliday": isHoliday,
        "type": type.index,
        "isExpanded": isExpanded,
      };

  Color getEventColor() {
    switch (type) {
      case EventType.holiday:
        return Colors.red;
      case EventType.academic:
        return Colors.blue;
      case EventType.cultural:
        return Colors.orange;
      case EventType.sports:
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  String getFormattedDate() {
    final months = [
      "", "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    
    return "${date.day} ${months[date.month]} ${date.year}";
  }

  IconData getEventIcon() {
    switch (type) {
      case EventType.holiday:
        return Icons.beach_access;
      case EventType.academic:
        return Icons.school;
      case EventType.cultural:
        return Icons.celebration;
      case EventType.sports:
        return Icons.sports;
      default:
        return Icons.event_note;
    }
  }
}

enum EventType {
  holiday,
  academic,
  cultural,
  sports,
  other
} 