import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_timing/model/school_timing_model.dart';

class SchoolTimingProvider extends ChangeNotifier {
  List<SchoolTimingModel> schoolTimingList = [];
  
  // Sample data for school timing
  List<Map<String, dynamic>> schoolTimingData = [
    {
      "day": "Monday to Friday",
      "timeSlots": [
        {
          "startTime": "07:30",
          "endTime": "08:00",
          "activity": "Morning Assembly",
          "description": "All students must attend the morning assembly in the school ground.",
          "isBreak": false
        },
        {
          "startTime": "08:00",
          "endTime": "08:45",
          "activity": "Period 1",
          "description": "First academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "08:45",
          "endTime": "09:30",
          "activity": "Period 2",
          "description": "Second academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "09:30",
          "endTime": "09:45",
          "activity": "Short Break",
          "description": "First short break for students to refresh.",
          "isBreak": true
        },
        {
          "startTime": "09:45",
          "endTime": "10:30",
          "activity": "Period 3",
          "description": "Third academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "10:30",
          "endTime": "11:15",
          "activity": "Period 4",
          "description": "Fourth academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "11:15",
          "endTime": "12:00",
          "activity": "Lunch Break",
          "description": "Main lunch break for all students.",
          "isBreak": true
        },
        {
          "startTime": "12:00",
          "endTime": "12:45",
          "activity": "Period 5",
          "description": "Fifth academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "12:45",
          "endTime": "13:30",
          "activity": "Period 6",
          "description": "Sixth academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "13:30",
          "endTime": "13:45",
          "activity": "Short Break",
          "description": "Second short break for students to refresh.",
          "isBreak": true
        },
        {
          "startTime": "13:45",
          "endTime": "14:30",
          "activity": "Period 7",
          "description": "Seventh academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "14:30",
          "endTime": "15:15",
          "activity": "Period 8",
          "description": "Eighth and final academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "15:15",
          "endTime": "16:00",
          "activity": "Extra-curricular Activities",
          "description": "Time allocated for clubs, sports, and other non-academic activities.",
          "isBreak": false
        },
        {
          "startTime": "16:00",
          "endTime": "16:30",
          "activity": "Dispersal",
          "description": "Students prepare to leave the school premises.",
          "isBreak": false
        }
      ],
      "isExpanded": true
    },
    {
      "day": "Saturday",
      "timeSlots": [
        {
          "startTime": "08:00",
          "endTime": "08:30",
          "activity": "Morning Assembly",
          "description": "All students must attend the morning assembly in the school ground.",
          "isBreak": false
        },
        {
          "startTime": "08:30",
          "endTime": "09:15",
          "activity": "Period 1",
          "description": "First academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "09:15",
          "endTime": "10:00",
          "activity": "Period 2",
          "description": "Second academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "10:00",
          "endTime": "10:30",
          "activity": "Break",
          "description": "Short break for students to refresh.",
          "isBreak": true
        },
        {
          "startTime": "10:30",
          "endTime": "11:15",
          "activity": "Period 3",
          "description": "Third academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "11:15",
          "endTime": "12:00",
          "activity": "Period 4",
          "description": "Fourth academic period of the day.",
          "isBreak": false
        },
        {
          "startTime": "12:00",
          "endTime": "13:00",
          "activity": "Club Activities",
          "description": "Time allocated for various club activities.",
          "isBreak": false
        },
        {
          "startTime": "13:00",
          "endTime": "13:30",
          "activity": "Dispersal",
          "description": "Students prepare to leave the school premises.",
          "isBreak": false
        }
      ],
      "isExpanded": false
    },
    {
      "day": "Sunday",
      "timeSlots": [
        {
          "startTime": "All Day",
          "endTime": "",
          "activity": "Holiday",
          "description": "School remains closed on Sundays.",
          "isBreak": false
        }
      ],
      "isExpanded": false
    }
  ];

  void getData() {
    schoolTimingList = schoolTimingData.map((data) => SchoolTimingModel.fromJson(data)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    schoolTimingList[index].isExpanded = !schoolTimingList[index].isExpanded;
    notifyListeners();
  }
} 