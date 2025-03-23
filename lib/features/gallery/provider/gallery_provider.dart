import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/gallery/model/gallery_model.dart';

class GalleryProvider extends ChangeNotifier {
  List<GalleryModel> galleryList = [];
  List<String> categoryList = ["All", "Events", "Sports", "Classroom", "Cultural"];
  String selectedCategory = "All";

  // Sample data for gallery
  List<Map<String, dynamic>> galleryData = [
    {
      "imageUrl": "assets/images/gallery/event1.jpg",
      "title": "Annual Day Celebration",
      "description": "Students performing in the annual day cultural program. The event showcased various talents including music, dance, and drama performances by students of all grades.",
      "date": "15-Dec-2023",
      "category": "Events",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/event2.jpg",
      "title": "Science Exhibition",
      "description": "Students presenting their innovative science projects in the school's annual science exhibition. Projects covered topics from renewable energy to environmental conservation.",
      "date": "28-Jan-2024",
      "category": "Events",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/sports1.jpg",
      "title": "Inter-School Cricket Tournament",
      "description": "Our school cricket team during the inter-school tournament where they secured the first position. The tournament included teams from 12 schools across the district.",
      "date": "10-Feb-2024",
      "category": "Sports",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/sports2.jpg",
      "title": "Annual Sports Day",
      "description": "Students participating in various athletic events during the annual sports day. The day included track events, field events, and team sports competitions.",
      "date": "05-Mar-2024",
      "category": "Sports",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/classroom1.jpg",
      "title": "Interactive Science Class",
      "description": "Students engaging in a hands-on science experiment in the laboratory. These practical sessions help students better understand theoretical concepts through direct experience.",
      "date": "12-Jan-2024",
      "category": "Classroom",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/classroom2.jpg",
      "title": "Computer Lab Session",
      "description": "Students learning programming skills in the state-of-the-art computer laboratory. The school provides modern computing facilities to ensure students develop relevant technical skills.",
      "date": "18-Feb-2024",
      "category": "Classroom",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/cultural1.jpg",
      "title": "Classical Dance Performance",
      "description": "Students performing traditional classical dance during the cultural exchange program. This program aims to promote cultural awareness and appreciation among students.",
      "date": "22-Dec-2023",
      "category": "Cultural",
      "isExpanded": false
    },
    {
      "imageUrl": "assets/images/gallery/cultural2.jpg",
      "title": "Music Concert",
      "description": "School band performing during the annual music concert. The concert featured both vocal and instrumental performances covering a wide range of musical genres.",
      "date": "15-Mar-2024",
      "category": "Cultural",
      "isExpanded": false
    }
  ];

  void getData() {
    galleryList = galleryData.map((data) => GalleryModel.fromJson(data)).toList();
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  List<GalleryModel> getFilteredGallery() {
    if (selectedCategory == "All") {
      return galleryList;
    } else {
      return galleryList.where((item) => item.category == selectedCategory).toList();
    }
  }

  void toggleExpanded(int index) {
    final filteredList = getFilteredGallery();
    if (index >= 0 && index < filteredList.length) {
      // Find the actual item in the main list that corresponds to the filtered item
      final item = filteredList[index];
      final mainIndex = galleryList.indexWhere((element) => 
        element.imageUrl == item.imageUrl && 
        element.title == item.title);
      
      if (mainIndex != -1) {
        galleryList[mainIndex].isExpanded = !galleryList[mainIndex].isExpanded;
        notifyListeners();
      }
    }
  }
} 