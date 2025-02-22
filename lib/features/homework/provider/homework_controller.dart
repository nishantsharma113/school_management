import 'package:school_management/core/library/library.dart';

class HomeworkProvider extends ChangeNotifier {
  List<Homework> homeworkList = [
    Homework("Learn Chapter 5 with one Essay", "English", "Today", false),
    Homework("Exercise Trigonometry 1st topic", "Maths", "", true),
    Homework("Hindi writing 3 pages", "Hindi", "", true),
    Homework("Test for History first session", "Social Science", "", false),
  ];

  void toggleCompletion(int index) {
    homeworkList[index].isCompleted = !homeworkList[index].isCompleted;
    notifyListeners();
  }
}

class Homework {
  String title;
  String subject;
  String date;
  bool isCompleted;
  
  Homework(this.title, this.subject, this.date, this.isCompleted);
}