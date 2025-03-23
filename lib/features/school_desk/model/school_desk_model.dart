
class SchoolDeskModel {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final String route;
  final DateTime? lastUpdated;
  final int notificationCount;
  final bool isNew;
  
  SchoolDeskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.route,
    this.lastUpdated,
    this.notificationCount = 0,
    this.isNew = false,
  });
  
  factory SchoolDeskModel.fromJson(Map<String, dynamic> json) {
    return SchoolDeskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      iconPath: json['iconPath'],
      route: json['route'],
      lastUpdated: json['lastUpdated'] != null 
          ? DateTime.parse(json['lastUpdated']) 
          : null,
      notificationCount: json['notificationCount'] ?? 0,
      isNew: json['isNew'] ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconPath': iconPath,
      'route': route,
      'lastUpdated': lastUpdated?.toIso8601String(),
      'notificationCount': notificationCount,
      'isNew': isNew,
    };
  }
  
  static List<SchoolDeskModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SchoolDeskModel.fromJson(json)).toList();
  }
  
  static List<Map<String, dynamic>> toJsonList(List<SchoolDeskModel> models) {
    return models.map((model) => model.toJson()).toList();
  }
} 