import 'dart:convert';

List<TeacherModel> teacherModelFromJson(String str) => 
    List<TeacherModel>.from(json.decode(str).map((x) => TeacherModel.fromJson(x)));

String teacherModelToJson(List<TeacherModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherModel {
  String name;
  String subject;
  String qualification;
  String experience;
  String email;
  String phone;
  String imageUrl;
  List<String> classesTaught;
  String about;
  bool isExpanded;

  TeacherModel({
    required this.name,
    required this.subject,
    required this.qualification,
    required this.experience,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.classesTaught,
    required this.about,
    this.isExpanded = false,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
    name: json["name"],
    subject: json["subject"],
    qualification: json["qualification"],
    experience: json["experience"],
    email: json["email"],
    phone: json["phone"],
    imageUrl: json["imageUrl"],
    classesTaught: List<String>.from(json["classesTaught"].map((x) => x)),
    about: json["about"],
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "subject": subject,
    "qualification": qualification,
    "experience": experience,
    "email": email,
    "phone": phone,
    "imageUrl": imageUrl,
    "classesTaught": List<dynamic>.from(classesTaught.map((x) => x)),
    "about": about,
    "isExpanded": isExpanded,
  };
} 