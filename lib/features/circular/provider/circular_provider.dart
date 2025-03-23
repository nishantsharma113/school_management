import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/circular/model/circular_model.dart';

class CircularProvider extends ChangeNotifier {
  List<CircularModel> _circulars = [];
  List<CircularModel> _filteredCirculars = [];
  bool _isLoading = true;
  String _currentCategory = "All";
  final List<String> _categories = ["All", "Academic", "Administrative", "Events", "Exams", "Holiday"];
  int _unreadCount = 0;

  List<CircularModel> get circulars => _circulars;
  List<CircularModel> get filteredCirculars => _filteredCirculars;
  bool get isLoading => _isLoading;
  String get currentCategory => _currentCategory;
  List<String> get categories => _categories;
  int get unreadCount => _unreadCount;

  // Sample data for circulars
  void _loadSampleData() {
    _circulars = [
      CircularModel(
        id: "1",
        title: "Annual Sports Day",
        description: "The annual sports day will be held on December 15, 2023. All students are required to participate in at least one event. Parents are cordially invited to attend.",
        date: "2023-12-01",
        issuedBy: "Principal",
        category: "Sports",
        isImportant: true,
        isRead: false,
        attachmentUrl: "https://example.com/sports_day_schedule.pdf",
      ),
      CircularModel(
        id: "2",
        title: "Fee Payment Reminder",
        description: "This is a reminder that the second term fees are due by November 30, 2023. Please ensure timely payment to avoid late fees.",
        date: "2023-11-15",
        issuedBy: "Accounts Department",
        category: "Fees",
        isImportant: true,
        isRead: true,
        attachmentUrl: null,
      ),
      CircularModel(
        id: "3",
        title: "Parent-Teacher Meeting",
        description: "The quarterly parent-teacher meeting is scheduled for December 8, 2023. Time slots will be shared via email.",
        date: "2023-11-25",
        issuedBy: "Vice Principal",
        category: "Meeting",
        isImportant: false,
        isRead: false,
        attachmentUrl: null,
      ),
      CircularModel(
        id: "4",
        title: "School Picnic",
        description: "The annual school picnic is scheduled for December 22, 2023. Students must submit the signed consent form by December 15.",
        date: "2023-12-05",
        issuedBy: "Activity Coordinator",
        category: "Events",
        isImportant: false,
        isRead: false,
        attachmentUrl: "https://example.com/picnic_details.pdf",
      ),
      CircularModel(
        id: "5",
        title: "Holiday Announcement",
        description: "The school will remain closed from December 25, 2023, to January 2, 2024, for winter vacation.",
        date: "2023-12-10",
        issuedBy: "Administrative Office",
        category: "Holiday",
        isImportant: true,
        isRead: false,
        attachmentUrl: null,
      ),
      CircularModel(
        id: "6",
        title: "Curriculum Update",
        description: "The mathematics curriculum for Class 6-8 has been updated. New workbooks will be distributed next week.",
        date: "2023-11-20",
        issuedBy: "Academic Head",
        category: "Academic",
        isImportant: false,
        isRead: true,
        attachmentUrl: "https://example.com/new_math_curriculum.pdf",
      ),
      CircularModel(
        id: "7",
        title: "School Uniform Update",
        description: "Starting January 2024, students must wear the new school uniform. Details about the uniform specifications and vendors are attached.",
        date: "2023-12-07",
        issuedBy: "Administrative Office",
        category: "Administrative",
        isImportant: true,
        isRead: false,
        attachmentUrl: "https://example.com/uniform_details.pdf",
      ),
    ];
  }

  void fetchCirculars() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    _loadSampleData();
    _updateUnreadCount();
    _applyFilter(_currentCategory);

    _isLoading = false;
    notifyListeners();
  }

  void _updateUnreadCount() {
    _unreadCount = _circulars.where((circular) => !circular.isRead).length;
  }

  void toggleExpanded(String id) {
    final index = _circulars.indexWhere((circular) => circular.id == id);
    if (index != -1) {
      _circulars[index] = _circulars[index].copyWith(isExpanded: !_circulars[index].isExpanded);
      
      // Also update in filtered circulars
      final filteredIndex = _filteredCirculars.indexWhere((circular) => circular.id == id);
      if (filteredIndex != -1) {
        _filteredCirculars[filteredIndex] = _filteredCirculars[filteredIndex].copyWith(
          isExpanded: !_filteredCirculars[filteredIndex].isExpanded
        );
      }
      
      notifyListeners();
    }
  }

  void markAsRead(String id) {
    final index = _circulars.indexWhere((circular) => circular.id == id);
    if (index != -1 && !_circulars[index].isRead) {
      _circulars[index] = _circulars[index].copyWith(isRead: true);
      
      // Also update in filtered circulars
      final filteredIndex = _filteredCirculars.indexWhere((circular) => circular.id == id);
      if (filteredIndex != -1) {
        _filteredCirculars[filteredIndex] = _filteredCirculars[filteredIndex].copyWith(isRead: true);
      }
      
      _updateUnreadCount();
      notifyListeners();
    }
  }

  void setCategory(String category) {
    if (_currentCategory != category) {
      _currentCategory = category;
      _applyFilter(category);
      notifyListeners();
    }
  }

  void _applyFilter(String category) {
    if (category == "All") {
      _filteredCirculars = List.from(_circulars);
    } else {
      _filteredCirculars = _circulars.where((circular) => circular.category == category).toList();
    }
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case "Academic":
        return AppColors.primary;
      case "Administrative":
        return AppColors.accent;
      case "Events":
        return AppColors.orange;
      case "Exams":
        return AppColors.red;
      case "Holiday":
        return AppColors.lightGreen;
      default:
        return AppColors.darkGray;
    }
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case "Academic":
        return Icons.school;
      case "Administrative":
        return Icons.business;
      case "Events":
        return Icons.event;
      case "Exams":
        return Icons.assignment;
      case "Holiday":
        return Icons.beach_access;
      default:
        return Icons.info;
    }
  }
} 