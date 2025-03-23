import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/homework/model/home_work_model.dart';

class HomeworkProvider extends ChangeNotifier {
  List<HomeWorkModel> homeworkList = [
    
  ];

  
  List<dynamic> homeworkDataList = [
  {
    "title": "Learn Chapter 5 with one Essay",
    "subject": "English",
    "status": "pending",
    "date": "Today"
  },
  {
    "title": "Exercise Trigonometry 1st topic",
    "subject": "Maths",
    "status": "completed",
    "date": "Today"
  },
  {
    "title": "Hindi writing 3 pages",
    "subject": "Hindi",
    "status": "completed",
    "date": "Today"
  },
  {
    "title": "Test for History first session",
    "subject": "Social Science",
    "status": "pending",
    "date": "Today"
  },
  {
    "title": "Learn Chapter 5 with one Essay",
    "subject": "English",
    "status": "pending",
    "date": "Yesterday"
  },
  {
    "title": "Exercise Trigonometry 1st topic",
    "subject": "Maths",
    "status": "completed",
    "date": "Yesterday"
  },
  {
    "title": "Learn Chapter 5 with one Essay",
    "subject": "English",
    "status": "pending",
    "date": "16 March 2020"
  },
  {
    "title": "Exercise Trigonometry 1st topic",
    "subject": "Maths",
    "status": "completed",
    "date": "16 March 2020"
  },
  {
    "title": "Learn Chapter 5 with one Essay",
    "subject": "English",
    "status": "pending",
    "date": "15 March 2020"
  },
  {
    "title": "Exercise Trigonometry 1st topic",
    "subject": "Maths",
    "status": "completed",
    "date": "15 March 2020"
  }
];

getData(){
  homeworkList = homeworkDataList.map((e) => HomeWorkModel.fromJson(e)).toList();
  notifyListeners();
}

  void toggleCompletion(int index) {
    if (index >= 0 && index < homeworkList.length) {
      homeworkList[index].status = homeworkList[index].status == Status.COMPLETED 
          ? Status.PENDING 
          : Status.COMPLETED;
      notifyListeners();
    }
  }
}

class Homework {
  String title;
  String subject;
  String date;
  bool isCompleted;
  
  Homework(this.title, this.subject, this.date, this.isCompleted);
}