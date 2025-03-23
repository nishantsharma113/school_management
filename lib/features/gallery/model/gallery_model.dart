import 'dart:convert';

List<GalleryModel> galleryModelFromJson(String str) => 
    List<GalleryModel>.from(json.decode(str).map((x) => GalleryModel.fromJson(x)));

String galleryModelToJson(List<GalleryModel> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryModel {
  String imageUrl;
  String title;
  String description;
  String date;
  String category;
  bool isExpanded;

  GalleryModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.isExpanded = false,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    imageUrl: json["imageUrl"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    category: json["category"],
    isExpanded: json["isExpanded"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "title": title,
    "description": description,
    "date": date,
    "category": category,
    "isExpanded": isExpanded,
  };
} 