// To parse this JSON data, do
//
//     final homeWorkModel = homeWorkModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<HomeWorkModel> homeWorkModelFromJson(String str) => List<HomeWorkModel>.from(json.decode(str).map((x) => HomeWorkModel.fromJson(x)));

String homeWorkModelToJson(List<HomeWorkModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeWorkModel {
    String title;
    String subject;
    Status status;
    String date;

    HomeWorkModel({
        required this.title,
        required this.subject,
        required this.status,
        required this.date,
    });

    factory HomeWorkModel.fromJson(Map<String, dynamic> json) => HomeWorkModel(
        title: json["title"],
        subject: json["subject"],
        status: statusValues.map[json["status"]]!,
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subject": subject,
        "status": statusValues.reverse[status],
        "date": date,
    };
}

enum Status {
    COMPLETED,
    PENDING
}

final statusValues = EnumValues({
    "completed": Status.COMPLETED,
    "pending": Status.PENDING
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
