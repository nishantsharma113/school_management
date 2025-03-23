import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_desk/model/school_desk_model.dart';

class SchoolDeskProvider extends ChangeNotifier {
  List<SchoolDeskModel> schoolDeskItems = [];
  bool isLoading = true;
  
  // Sample data for school desk items
  List<Map<String, dynamic>> sampleDeskItems = [
    {
      'id': '1',
      'title': 'Homework',
      'description': 'View your pending and completed homework assignments',
      'iconPath': homeWork,
      'route': AppRoutes.homework,
      'lastUpdated': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
      'notificationCount': 3,
      'isNew': true,
    },
    {
      'id': '2',
      'title': 'Exam Schedule',
      'description': 'View upcoming exams and test dates',
      'iconPath': examSchedule,
      'route': AppRoutes.examSchedule,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
      'notificationCount': 0,
      'isNew': false,
    },
    {
      'id': '3',
      'title': 'Attendance',
      'description': 'Check your attendance record and statistics',
      'iconPath': attendance,
      'route': AppRoutes.attendance,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
      'notificationCount': 0,
      'isNew': false,
    },
    {
      'id': '4',
      'title': 'Results',
      'description': 'View your exam results and academic performance',
      'iconPath': resultIcon,
      'route': AppRoutes.examResult,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
      'notificationCount': 1,
      'isNew': false,
    },
    {
      'id': '5',
      'title': 'Syllabus',
      'description': 'Access your course syllabus and study materials',
      'iconPath': syllabus,
      'route': AppRoutes.syllabus,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      'notificationCount': 0,
      'isNew': false,
    },
    {
      'id': '6',
      'title': 'Remarks',
      'description': 'View teacher remarks and feedback on your performance',
      'iconPath': remark,
      'route': AppRoutes.remark,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
      'notificationCount': 2,
      'isNew': true,
    },
    {
      'id': '7',
      'title': 'Time Table',
      'description': 'View your class schedule and timetable',
      'iconPath': timeTable,
      'route': AppRoutes.timetable,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
      'notificationCount': 0,
      'isNew': false,
    },
    {
      'id': '8',
      'title': 'Fee Details',
      'description': 'Check fee payment status and pending dues',
      'iconPath': feeDeatils,
      'route': AppRoutes.feesDetails,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 45)).toIso8601String(),
      'notificationCount': 1,
      'isNew': false,
    },
  ];
  
  void getData() async {
    // Simulate network delay
    isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 2));
    
    schoolDeskItems = SchoolDeskModel.fromJsonList(sampleDeskItems);
    isLoading = false;
    notifyListeners();
  }
  
  List<SchoolDeskModel> get newItems {
    return schoolDeskItems.where((item) => item.isNew).toList();
  }
  
  List<SchoolDeskModel> get withNotifications {
    return schoolDeskItems.where((item) => item.notificationCount > 0).toList();
  }
  
  int get totalNotifications {
    return schoolDeskItems.fold(0, (sum, item) => sum + item.notificationCount);
  }
  
  String getFormattedLastUpdated(DateTime? date) {
    if (date == null) return '';
    
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 30) {
      return DateFormat('MMM d, yyyy').format(date);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
} 