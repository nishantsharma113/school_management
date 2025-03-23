import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/exam_schedule/model/exam_schedule_model.dart';

class ExamScheduleProvider extends ChangeNotifier {
  List<ExamScheduleModel> examScheduleList = [];
  String examTitle = "Mid-Term Examination 2024";
  String examPeriod = "May 10 - May 20, 2024";

  // Sample data for exam schedule
  List<Map<String, dynamic>> scheduleData = [
    {
      "date": "10 May 2024",
      "day": "Monday",
      "exams": [
        {
          "subject": "Mathematics",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Examination Hall A",
          "duration": "2 hours",
          "examType": "Theory"
        }
      ],
      "isExpanded": true
    },
    {
      "date": "12 May 2024",
      "day": "Wednesday",
      "exams": [
        {
          "subject": "Science",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Examination Hall A",
          "duration": "2 hours",
          "examType": "Theory"
        },
        {
          "subject": "Science Lab",
          "time": "01:00 PM - 03:00 PM",
          "venue": "Science Laboratory",
          "duration": "2 hours",
          "examType": "Practical"
        }
      ],
      "isExpanded": false
    },
    {
      "date": "14 May 2024",
      "day": "Friday",
      "exams": [
        {
          "subject": "English",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Examination Hall B",
          "duration": "2 hours",
          "examType": "Theory"
        }
      ],
      "isExpanded": false
    },
    {
      "date": "16 May 2024",
      "day": "Monday",
      "exams": [
        {
          "subject": "Social Studies",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Examination Hall A",
          "duration": "2 hours",
          "examType": "Theory"
        }
      ],
      "isExpanded": false
    },
    {
      "date": "18 May 2024",
      "day": "Wednesday",
      "exams": [
        {
          "subject": "Hindi",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Examination Hall B",
          "duration": "2 hours",
          "examType": "Theory"
        }
      ],
      "isExpanded": false
    },
    {
      "date": "20 May 2024",
      "day": "Friday",
      "exams": [
        {
          "subject": "Computer Science",
          "time": "09:00 AM - 11:00 AM",
          "venue": "Computer Lab",
          "duration": "2 hours",
          "examType": "Theory"
        },
        {
          "subject": "Computer Science Lab",
          "time": "01:00 PM - 03:00 PM",
          "venue": "Computer Lab",
          "duration": "2 hours",
          "examType": "Practical"
        }
      ],
      "isExpanded": false
    }
  ];

  void getData() {
    examScheduleList = scheduleData.map((data) => ExamScheduleModel.fromJson(data)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    for (int i = 0; i < examScheduleList.length; i++) {
      examScheduleList[i].isExpanded = (i == index);
    }
    notifyListeners();
  }
} 