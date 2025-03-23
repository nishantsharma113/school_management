import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final LocationType type;
  final double latitude;
  final double longitude;
  final List<String> tags;
  final String floor;
  final bool isActive;
  final String? openingHours;

  LocationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.tags,
    required this.floor,
    this.isActive = true,
    this.openingHours,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        type: locationTypeFromString(json["type"]),
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        tags: List<String>.from(json["tags"].map((x) => x)),
        floor: json["floor"],
        isActive: json["isActive"] ?? true,
        openingHours: json["openingHours"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "type": locationTypeToString(type),
        "latitude": latitude,
        "longitude": longitude,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "floor": floor,
        "isActive": isActive,
        "openingHours": openingHours,
      };
}

enum LocationType {
  classroom,
  laboratory,
  library,
  cafeteria,
  auditorium,
  sportsGround,
  parkingLot,
  adminOffice,
  staffRoom,
  restroom,
  other
}

String locationTypeToString(LocationType type) {
  switch (type) {
    case LocationType.classroom:
      return "classroom";
    case LocationType.laboratory:
      return "laboratory";
    case LocationType.library:
      return "library";
    case LocationType.cafeteria:
      return "cafeteria";
    case LocationType.auditorium:
      return "auditorium";
    case LocationType.sportsGround:
      return "sportsGround";
    case LocationType.parkingLot:
      return "parkingLot";
    case LocationType.adminOffice:
      return "adminOffice";
    case LocationType.staffRoom:
      return "staffRoom";
    case LocationType.restroom:
      return "restroom";
    case LocationType.other:
      return "other";
  }
}

LocationType locationTypeFromString(String type) {
  switch (type) {
    case "classroom":
      return LocationType.classroom;
    case "laboratory":
      return LocationType.laboratory;
    case "library":
      return LocationType.library;
    case "cafeteria":
      return LocationType.cafeteria;
    case "auditorium":
      return LocationType.auditorium;
    case "sportsGround":
      return LocationType.sportsGround;
    case "parkingLot":
      return LocationType.parkingLot;
    case "adminOffice":
      return LocationType.adminOffice;
    case "staffRoom":
      return LocationType.staffRoom;
    case "restroom":
      return LocationType.restroom;
    default:
      return LocationType.other;
  }
} 