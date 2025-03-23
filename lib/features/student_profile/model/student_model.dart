import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) => 
    List<StudentModel>.from(json.decode(str).map((x) => StudentModel.fromJson(x)));

String studentModelToJson(List<StudentModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentModel {
  String name;
  String rollNumber;
  String className;
  String section;
  String admissionNumber;
  String dob;
  String gender;
  String fatherName;
  String motherName;
  String address;
  String bloodGroup;
  String contactNumber;
  String email;
  String imageUrl;
  List<AcademicRecord> academicRecords;
  List<String> activities;
  bool isExpanded;

  StudentModel({
    required this.name,
    required this.rollNumber,
    required this.className,
    required this.section,
    required this.admissionNumber,
    required this.dob,
    required this.gender,
    required this.fatherName,
    required this.motherName,
    required this.address,
    required this.bloodGroup,
    required this.contactNumber,
    required this.email,
    required this.imageUrl,
    required this.academicRecords,
    required this.activities,
    this.isExpanded = false,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    name: json["name"],
    rollNumber: json["rollNumber"],
    className: json["className"],
    section: json["section"],
    admissionNumber: json["admissionNumber"],
    dob: json["dob"],
    gender: json["gender"],
    fatherName: json["fatherName"],
    motherName: json["motherName"],
    address: json["address"],
    bloodGroup: json["bloodGroup"],
    contactNumber: json["contactNumber"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    academicRecords: List<AcademicRecord>.from(json["academicRecords"].map((x) => AcademicRecord.fromJson(x))),
    activities: List<String>.from(json["activities"].map((x) => x)),
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rollNumber": rollNumber,
    "className": className,
    "section": section,
    "admissionNumber": admissionNumber,
    "dob": dob,
    "gender": gender,
    "fatherName": fatherName,
    "motherName": motherName,
    "address": address,
    "bloodGroup": bloodGroup,
    "contactNumber": contactNumber,
    "email": email,
    "imageUrl": imageUrl,
    "academicRecords": List<dynamic>.from(academicRecords.map((x) => x.toJson())),
    "activities": List<dynamic>.from(activities.map((x) => x)),
    "isExpanded": isExpanded,
  };
}

class AcademicRecord {
  String year;
  String grade;
  double percentage;
  String remarks;

  AcademicRecord({
    required this.year,
    required this.grade,
    required this.percentage,
    required this.remarks,
  });

  factory AcademicRecord.fromJson(Map<String, dynamic> json) => AcademicRecord(
    year: json["year"],
    grade: json["grade"],
    percentage: json["percentage"].toDouble(),
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "grade": grade,
    "percentage": percentage,
    "remarks": remarks,
  };
} 