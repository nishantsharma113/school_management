import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/timetable/model/timetable_model.dart';

class TimetableProvider extends ChangeNotifier {
  List<TimetableModel> timetableList = [];
  String selectedDay = "Monday";
  
  // Sample data for timetable
  List<Map<String, dynamic>> timetableData = [
    {
      "day": "Monday",
      "periods": [
        {
          "subject": "English",
          "time": "8:30 - 9:20",
          "teacher": "Mrs. Sarah Johnson",
          "periodType": "class"
        },
        {
          "subject": "Mathematics",
          "time": "9:25 - 10:15",
          "teacher": "Mr. Robert Smith",
          "periodType": "class"
        },
        {
          "subject": "Break",
          "time": "10:15 - 10:30",
          "teacher": "",
          "periodType": "break"
        },
        {
          "subject": "Science",
          "time": "10:30 - 11:20",
          "teacher": "Ms. Jessica Parker",
          "periodType": "class"
        },
        {
          "subject": "Hindi",
          "time": "11:25 - 12:15",
          "teacher": "Mrs. Priya Sharma",
          "periodType": "class"
        },
        {
          "subject": "Lunch",
          "time": "12:15 - 12:45",
          "teacher": "",
          "periodType": "lunch"
        },
        {
          "subject": "Social Studies",
          "time": "12:45 - 1:35",
          "teacher": "Mr. David Wilson",
          "periodType": "class"
        },
        {
          "subject": "Computer Science",
          "time": "1:40 - 2:30",
          "teacher": "Mr. Michael Brown",
          "periodType": "class"
        }
      ],
      "isExpanded": true
    },
    {
      "day": "Tuesday",
      "periods": [
        {
          "subject": "Mathematics",
          "time": "8:30 - 9:20",
          "teacher": "Mr. Robert Smith",
          "periodType": "class"
        },
        {
          "subject": "Science",
          "time": "9:25 - 10:15",
          "teacher": "Ms. Jessica Parker",
          "periodType": "class"
        },
        {
          "subject": "Break",
          "time": "10:15 - 10:30",
          "teacher": "",
          "periodType": "break"
        },
        {
          "subject": "English",
          "time": "10:30 - 11:20",
          "teacher": "Mrs. Sarah Johnson",
          "periodType": "class"
        },
        {
          "subject": "Physical Education",
          "time": "11:25 - 12:15",
          "teacher": "Mr. James Anderson",
          "periodType": "class"
        },
        {
          "subject": "Lunch",
          "time": "12:15 - 12:45",
          "teacher": "",
          "periodType": "lunch"
        },
        {
          "subject": "Art",
          "time": "12:45 - 1:35",
          "teacher": "Ms. Emily Wilson",
          "periodType": "class"
        },
        {
          "subject": "Hindi",
          "time": "1:40 - 2:30",
          "teacher": "Mrs. Priya Sharma",
          "periodType": "class"
        }
      ],
      "isExpanded": false
    },
    {
      "day": "Wednesday",
      "periods": [
        {
          "subject": "Science",
          "time": "8:30 - 9:20",
          "teacher": "Ms. Jessica Parker",
          "periodType": "class"
        },
        {
          "subject": "Social Studies",
          "time": "9:25 - 10:15",
          "teacher": "Mr. David Wilson",
          "periodType": "class"
        },
        {
          "subject": "Break",
          "time": "10:15 - 10:30",
          "teacher": "",
          "periodType": "break"
        },
        {
          "subject": "Mathematics",
          "time": "10:30 - 11:20",
          "teacher": "Mr. Robert Smith",
          "periodType": "class"
        },
        {
          "subject": "English",
          "time": "11:25 - 12:15",
          "teacher": "Mrs. Sarah Johnson",
          "periodType": "class"
        },
        {
          "subject": "Lunch",
          "time": "12:15 - 12:45",
          "teacher": "",
          "periodType": "lunch"
        },
        {
          "subject": "Music",
          "time": "12:45 - 1:35",
          "teacher": "Mr. Daniel White",
          "periodType": "class"
        },
        {
          "subject": "Hindi",
          "time": "1:40 - 2:30",
          "teacher": "Mrs. Priya Sharma",
          "periodType": "class"
        }
      ],
      "isExpanded": false
    },
    {
      "day": "Thursday",
      "periods": [
        {
          "subject": "Hindi",
          "time": "8:30 - 9:20",
          "teacher": "Mrs. Priya Sharma",
          "periodType": "class"
        },
        {
          "subject": "English",
          "time": "9:25 - 10:15",
          "teacher": "Mrs. Sarah Johnson",
          "periodType": "class"
        },
        {
          "subject": "Break",
          "time": "10:15 - 10:30",
          "teacher": "",
          "periodType": "break"
        },
        {
          "subject": "Computer Science",
          "time": "10:30 - 11:20",
          "teacher": "Mr. Michael Brown",
          "periodType": "class"
        },
        {
          "subject": "Mathematics",
          "time": "11:25 - 12:15",
          "teacher": "Mr. Robert Smith",
          "periodType": "class"
        },
        {
          "subject": "Lunch",
          "time": "12:15 - 12:45",
          "teacher": "",
          "periodType": "lunch"
        },
        {
          "subject": "Science",
          "time": "12:45 - 1:35",
          "teacher": "Ms. Jessica Parker",
          "periodType": "class"
        },
        {
          "subject": "Social Studies",
          "time": "1:40 - 2:30",
          "teacher": "Mr. David Wilson",
          "periodType": "class"
        }
      ],
      "isExpanded": false
    },
    {
      "day": "Friday",
      "periods": [
        {
          "subject": "Social Studies",
          "time": "8:30 - 9:20",
          "teacher": "Mr. David Wilson",
          "periodType": "class"
        },
        {
          "subject": "Hindi",
          "time": "9:25 - 10:15",
          "teacher": "Mrs. Priya Sharma",
          "periodType": "class"
        },
        {
          "subject": "Break",
          "time": "10:15 - 10:30",
          "teacher": "",
          "periodType": "break"
        },
        {
          "subject": "English",
          "time": "10:30 - 11:20",
          "teacher": "Mrs. Sarah Johnson",
          "periodType": "class"
        },
        {
          "subject": "Mathematics",
          "time": "11:25 - 12:15",
          "teacher": "Mr. Robert Smith",
          "periodType": "class"
        },
        {
          "subject": "Lunch",
          "time": "12:15 - 12:45",
          "teacher": "",
          "periodType": "lunch"
        },
        {
          "subject": "Science",
          "time": "12:45 - 1:35",
          "teacher": "Ms. Jessica Parker",
          "periodType": "class"
        },
        {
          "subject": "Physical Education",
          "time": "1:40 - 2:30",
          "teacher": "Mr. James Anderson",
          "periodType": "class"
        }
      ],
      "isExpanded": false
    }
  ];

  void getData() {
    timetableList = timetableData.map((data) => TimetableModel.fromJson(data)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    for (int i = 0; i < timetableList.length; i++) {
      timetableList[i].isExpanded = (i == index);
    }
    selectedDay = timetableList[index].day;
    notifyListeners();
  }

  void selectDay(String day) {
    selectedDay = day;
    for (int i = 0; i < timetableList.length; i++) {
      if (timetableList[i].day == day) {
        timetableList[i].isExpanded = true;
      } else {
        timetableList[i].isExpanded = false;
      }
    }
    notifyListeners();
  }
} 