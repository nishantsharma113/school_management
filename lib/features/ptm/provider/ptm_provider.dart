import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/ptm/model/ptm_model.dart';

class PTMProvider extends ChangeNotifier {
  List<PTMModel> _ptmList = [];
  List<PTMModel> _filteredList = [];
  bool _isLoading = true;
  String _filterStatus = "All";

  List<PTMModel> get ptmList => _ptmList;
  List<PTMModel> get filteredList => _filteredList;
  bool get isLoading => _isLoading;
  String get filterStatus => _filterStatus;

  // Sample data for PTM meetings
  final List<Map<String, dynamic>> _samplePTMData = [
    {
      "id": "1",
      "teacherName": "Mrs. Sarah Johnson",
      "subject": "Mathematics",
      "date": "25 March, 2025",
      "time": "10:00 AM - 10:15 AM",
      "venue": "Room 101",
      "status": "upcoming",
      "notes": "Discuss progress in algebra and geometry"
    },
    {
      "id": "2",
      "teacherName": "Mr. David Williams",
      "subject": "Science",
      "date": "25 March, 2025",
      "time": "10:30 AM - 10:45 AM",
      "venue": "Science Lab",
      "status": "upcoming",
      "notes": "Review lab work and upcoming science project"
    },
    {
      "id": "3",
      "teacherName": "Ms. Elizabeth Brown",
      "subject": "English",
      "date": "25 March, 2025",
      "time": "11:00 AM - 11:15 AM",
      "venue": "Room 203",
      "status": "upcoming",
      "notes": "Discuss reading comprehension and essay writing"
    },
    {
      "id": "4",
      "teacherName": "Mr. Robert Miller",
      "subject": "History",
      "date": "25 March, 2025",
      "time": "11:30 AM - 11:45 AM",
      "venue": "Room 105",
      "status": "upcoming",
      "notes": "Review historical analysis and research project"
    },
    {
      "id": "5",
      "teacherName": "Mrs. Jennifer Davis",
      "subject": "Computer Science",
      "date": "20 February, 2025",
      "time": "09:30 AM - 09:45 AM",
      "venue": "Computer Lab",
      "status": "completed",
      "notes": "Discussed programming concepts and project progress"
    },
    {
      "id": "6",
      "teacherName": "Mr. Michael Wilson",
      "subject": "Physical Education",
      "date": "15 February, 2025",
      "time": "10:00 AM - 10:15 AM",
      "venue": "Sports Hall",
      "status": "completed",
      "notes": "Reviewed physical fitness progress and team participation"
    },
    {
      "id": "7",
      "teacherName": "Ms. Patricia Martinez",
      "subject": "Art",
      "date": "10 March, 2025",
      "time": "09:00 AM - 09:15 AM",
      "venue": "Art Studio",
      "status": "cancelled",
      "notes": "Was scheduled to review portfolio and discuss art technique"
    },
  ];

  void fetchPTMData() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    _ptmList = _samplePTMData.map((data) => PTMModel.fromJson(data)).toList();
    _applyFilter(_filterStatus);
    
    _isLoading = false;
    notifyListeners();
  }

  void toggleExpanded(String id) {
    final index = _ptmList.indexWhere((ptm) => ptm.id == id);
    if (index != -1) {
      _ptmList[index] = _ptmList[index].copyWith(isExpanded: !_ptmList[index].isExpanded);
      
      // Also update in filtered list if present
      final filteredIndex = _filteredList.indexWhere((ptm) => ptm.id == id);
      if (filteredIndex != -1) {
        _filteredList[filteredIndex] = _filteredList[filteredIndex].copyWith(
          isExpanded: !_filteredList[filteredIndex].isExpanded
        );
      }
      
      notifyListeners();
    }
  }

  void setFilter(String status) {
    if (_filterStatus != status) {
      _filterStatus = status;
      _applyFilter(status);
      notifyListeners();
    }
  }

  void _applyFilter(String filter) {
    if (filter == "All") {
      _filteredList = List.from(_ptmList);
    } else {
      final statusFilter = filter.toLowerCase();
      _filteredList = _ptmList.where((ptm) {
        return ptmStatusToString(ptm.status) == statusFilter;
      }).toList();
    }
  }

  Color getStatusColor(PTMStatus status) {
    switch (status) {
      case PTMStatus.upcoming:
        return AppColors.primary;
      case PTMStatus.completed:
        return AppColors.lightGreen;
      case PTMStatus.cancelled:
        return AppColors.red;
    }
  }

  IconData getStatusIcon(PTMStatus status) {
    switch (status) {
      case PTMStatus.upcoming:
        return Icons.event;
      case PTMStatus.completed:
        return Icons.check_circle_outline;
      case PTMStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }
} 