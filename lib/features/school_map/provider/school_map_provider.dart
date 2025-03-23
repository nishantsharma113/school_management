import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_map/model/location_model.dart';

class SchoolMapProvider extends ChangeNotifier {
  List<LocationModel> locations = [];
  List<LocationModel> filteredLocations = [];
  LocationType? selectedType;
  String searchQuery = '';
  bool isLoading = true;
  
  // For location selection and map state
  LocationModel? selectedLocation;
  Set<Marker> markers = {};
  String selectedFloor = "All Floors";
  
  // Initial camera position
  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 17,
  );
  
  // List of available floors
  final List<String> availableFloors = [
    "All Floors",
    "Ground Floor",
    "First Floor", 
    "Second Floor",
    "Outdoor"
  ];
  
  // Sample data for school locations
  final List<Map<String, dynamic>> sampleLocations = [
    {
      "id": "1",
      "name": "Main Administrative Building",
      "description": "Houses the principal's office, administrative staff, and main reception area.",
      "imageUrl": "assets/images/admin_building.jpg",
      "type": "adminOffice",
      "latitude": 37.7749,
      "longitude": -122.4194,
      "tags": ["admin", "principal", "office", "reception"],
      "floor": "Ground Floor",
      "isActive": true,
      "openingHours": "8:00 AM - 4:00 PM"
    },
    {
      "id": "2",
      "name": "Science Laboratory",
      "description": "Fully equipped laboratory for physics, chemistry, and biology experiments.",
      "imageUrl": "assets/images/science_lab.jpg",
      "type": "laboratory",
      "latitude": 37.7750,
      "longitude": -122.4195,
      "tags": ["science", "lab", "experiments", "equipment"],
      "floor": "First Floor",
      "isActive": true,
      "openingHours": "9:00 AM - 3:00 PM"
    },
    {
      "id": "3",
      "name": "Library",
      "description": "Modern library with extensive collection of books, digital resources, and study spaces.",
      "imageUrl": "assets/images/library.jpg",
      "type": "library",
      "latitude": 37.7751,
      "longitude": -122.4193,
      "tags": ["books", "study", "reading", "resources"],
      "floor": "Ground Floor",
      "isActive": true,
      "openingHours": "8:30 AM - 5:30 PM"
    },
    {
      "id": "4",
      "name": "Cafeteria",
      "description": "Spacious dining area with healthy food options and vending machines.",
      "imageUrl": "assets/images/cafeteria.jpg",
      "type": "cafeteria",
      "latitude": 37.7752,
      "longitude": -122.4192,
      "tags": ["food", "lunch", "meals", "snacks"],
      "floor": "Ground Floor",
      "isActive": true,
      "openingHours": "7:30 AM - 2:30 PM"
    },
    {
      "id": "5",
      "name": "Main Auditorium",
      "description": "Large auditorium for school events, assemblies, and performances.",
      "imageUrl": "assets/images/auditorium.jpg",
      "type": "auditorium",
      "latitude": 37.7753,
      "longitude": -122.4191,
      "tags": ["events", "performances", "assembly", "stage"],
      "floor": "Ground Floor",
      "isActive": true,
      "openingHours": "By Appointment"
    },
    {
      "id": "6",
      "name": "Sports Ground",
      "description": "Outdoor sports facilities including track, football field, and basketball courts.",
      "imageUrl": "assets/images/sports_ground.jpg",
      "type": "sportsGround",
      "latitude": 37.7747,
      "longitude": -122.4196,
      "tags": ["sports", "games", "physical education", "outdoor"],
      "floor": "Outdoor",
      "isActive": true,
      "openingHours": "7:00 AM - 5:00 PM"
    },
    {
      "id": "7",
      "name": "Parking Lot A",
      "description": "Main parking area for staff and visitors.",
      "imageUrl": "assets/images/parking_lot.jpg",
      "type": "parkingLot",
      "latitude": 37.7748,
      "longitude": -122.4197,
      "tags": ["parking", "vehicles", "transportation"],
      "floor": "Outdoor",
      "isActive": true,
      "openingHours": "24 Hours"
    },
    {
      "id": "8",
      "name": "Class 10-A",
      "description": "Standard classroom for 10th grade section A students.",
      "imageUrl": "assets/images/classroom.jpg",
      "type": "classroom",
      "latitude": 37.7754,
      "longitude": -122.4190,
      "tags": ["class", "10th grade", "study"],
      "floor": "Second Floor",
      "isActive": true,
      "openingHours": "8:00 AM - 3:30 PM"
    },
    {
      "id": "9",
      "name": "Teachers' Lounge",
      "description": "Staff room for teachers to rest, prepare lessons, and hold meetings.",
      "imageUrl": "assets/images/staff_room.jpg",
      "type": "staffRoom",
      "latitude": 37.7755,
      "longitude": -122.4189,
      "tags": ["teachers", "staff", "lounge", "meetings"],
      "floor": "First Floor",
      "isActive": true,
      "openingHours": "7:30 AM - 4:30 PM"
    },
    {
      "id": "10",
      "name": "Computer Lab",
      "description": "Modern computer laboratory with high-speed internet and latest software.",
      "imageUrl": "assets/images/computer_lab.jpg",
      "type": "laboratory",
      "latitude": 37.7756,
      "longitude": -122.4188,
      "tags": ["computers", "IT", "technology", "internet"],
      "floor": "First Floor",
      "isActive": true,
      "openingHours": "9:00 AM - 3:00 PM"
    }
  ];

  void getData() async {
    isLoading = true;
    notifyListeners();
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    locations = sampleLocations.map((location) => LocationModel.fromJson(location)).toList();
    filteredLocations = List.from(locations);
    isLoading = false;
    
    // Generate markers after loading data
    updateMarkers();
    
    notifyListeners();
  }
  
  // Generates markers for all filtered locations
  void updateMarkers() {
    markers = filteredLocations.map((location) {
      return Marker(
        markerId: MarkerId(location.id),
        position: LatLng(location.latitude, location.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(getMarkerHue(location.type)),
        infoWindow: InfoWindow(
          title: location.name,
          snippet: getLocationTypeDisplay(location.type),
        ),
        onTap: () {
          selectLocation(location);
        },
      );
    }).toSet();
    
    notifyListeners();
  }
  
  // Selects a location and updates the state
  void selectLocation(LocationModel location) {
    selectedLocation = location;
    notifyListeners();
  }
  
  // Clears the selected location
  void clearSelectedLocation() {
    selectedLocation = null;
    notifyListeners();
  }
  
  // Sets the selected floor and filters locations
  void setSelectedFloor(String floor) {
    selectedFloor = floor;
    _applyFilters();
  }
  
  void filterByType(LocationType? type) {
    selectedType = type;
    _applyFilters();
  }
  
  void searchLocations(String query) {
    searchQuery = query.trim().toLowerCase();
    _applyFilters();
  }
  
  void _applyFilters() {
    filteredLocations = locations.where((location) {
      // Type filter
      bool matchesType = selectedType == null || location.type == selectedType;
      
      // Search filter
      bool matchesSearch = searchQuery.isEmpty || 
                          location.name.toLowerCase().contains(searchQuery) || 
                          location.description.toLowerCase().contains(searchQuery) ||
                          location.tags.any((tag) => tag.toLowerCase().contains(searchQuery));
      
      // Floor filter
      bool matchesFloor = selectedFloor == "All Floors" || location.floor == selectedFloor;
      
      return matchesType && matchesSearch && matchesFloor;
    }).toList();
    
    // Update markers when filters change
    updateMarkers();
    
    notifyListeners();
  }
  
  void resetFilters() {
    selectedType = null;
    searchQuery = '';
    selectedFloor = "All Floors";
    filteredLocations = List.from(locations);
    
    // Update markers after reset
    updateMarkers();
    
    notifyListeners();
  }
  
  // Get locations for a specific floor
  List<LocationModel> getLocationsByFloor(String floor) {
    if (floor == "All Floors") {
      return locations;
    }
    
    return locations.where((location) => location.floor == floor).toList();
  }
  
  // Get count of locations for each floor
  Map<String, int> getFloorCounts() {
    final Map<String, int> counts = {
      for (var floor in availableFloors) floor: 0,
    };
    
    for (var location in locations) {
      counts[location.floor] = (counts[location.floor] ?? 0) + 1;
      counts["All Floors"] = (counts["All Floors"] ?? 0) + 1;
    }
    
    return counts;
  }
  
  String getLocationTypeDisplay(LocationType type) {
    switch (type) {
      case LocationType.classroom:
        return "Classroom";
      case LocationType.laboratory:
        return "Laboratory";
      case LocationType.library:
        return "Library";
      case LocationType.cafeteria:
        return "Cafeteria";
      case LocationType.auditorium:
        return "Auditorium";
      case LocationType.sportsGround:
        return "Sports Ground";
      case LocationType.parkingLot:
        return "Parking Lot";
      case LocationType.adminOffice:
        return "Admin Office";
      case LocationType.staffRoom:
        return "Staff Room";
      case LocationType.restroom:
        return "Restroom";
      case LocationType.other:
        return "Other";
    }
  }
  
  Color getLocationTypeColor(LocationType type) {
    switch (type) {
      case LocationType.classroom:
        return AppColors.primary;
      case LocationType.laboratory:
        return AppColors.orange;
      case LocationType.library:
        return AppColors.purple;
      case LocationType.cafeteria:
        return AppColors.red;
      case LocationType.auditorium:
        return AppColors.blue;
      case LocationType.sportsGround:
        return AppColors.lightGreen;
      case LocationType.parkingLot:
        return AppColors.darkGray;
      case LocationType.adminOffice:
        return AppColors.accent;
      case LocationType.staffRoom:
        return AppColors.yellow;
      case LocationType.restroom:
        return AppColors.blue.withAlpha(179);
      case LocationType.other:
        return AppColors.darkGray;
    }
  }
  
  IconData getLocationTypeIcon(LocationType type) {
    switch (type) {
      case LocationType.classroom:
        return Icons.school;
      case LocationType.laboratory:
        return Icons.science;
      case LocationType.library:
        return Icons.local_library;
      case LocationType.cafeteria:
        return Icons.restaurant;
      case LocationType.auditorium:
        return Icons.theater_comedy;
      case LocationType.sportsGround:
        return Icons.sports_soccer;
      case LocationType.parkingLot:
        return Icons.local_parking;
      case LocationType.adminOffice:
        return Icons.business;
      case LocationType.staffRoom:
        return Icons.group;
      case LocationType.restroom:
        return Icons.wc;
      case LocationType.other:
        return Icons.place;
    }
  }
  
  // Marker hue mapping logic moved from SchoolMapScreen
  double getMarkerHue(LocationType type) {
    switch (type) {
      case LocationType.classroom:
        return BitmapDescriptor.hueBlue;
      case LocationType.laboratory:
        return BitmapDescriptor.hueOrange;
      case LocationType.library:
        return BitmapDescriptor.hueViolet;
      case LocationType.cafeteria:
        return BitmapDescriptor.hueRed;
      case LocationType.auditorium:
        return BitmapDescriptor.hueAzure;
      case LocationType.sportsGround:
        return BitmapDescriptor.hueGreen;
      case LocationType.parkingLot:
        return BitmapDescriptor.hueYellow;
      case LocationType.adminOffice:
        return BitmapDescriptor.hueRose;
      case LocationType.staffRoom:
        return BitmapDescriptor.hueMagenta;
      case LocationType.restroom:
        return BitmapDescriptor.hueCyan;
      case LocationType.other:
        return BitmapDescriptor.hueYellow;
    }
  }
} 