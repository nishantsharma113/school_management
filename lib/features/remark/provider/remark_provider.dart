import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/remark/model/remark_model.dart';

class RemarkProvider extends ChangeNotifier {
  List<RemarkModel> remarkList = [];

  // Sample data for remarks
  List<Map<String, dynamic>> remarkData = [
    {
      "subject": "Mathematics",
      "teacher": "Mr. Robert Smith",
      "date": "10 May 2024",
      "content": "Yogita has shown exceptional problem-solving skills in recent algebra assignments. She demonstrates a strong understanding of complex mathematical concepts and helps her peers in group activities.",
      "type": "Positive",
      "isExpanded": true
    },
    {
      "subject": "Science",
      "teacher": "Ms. Jessica Parker",
      "date": "5 May 2024",
      "content": "While Yogita is attentive in class, she needs to improve her laboratory report documentation. Her practical skills are good, but written explanations require more detail and clarity.",
      "type": "Neutral",
      "isExpanded": false
    },
    {
      "subject": "English",
      "teacher": "Mrs. Sarah Johnson",
      "date": "2 May 2024",
      "content": "Yogita's recent essay demonstrated excellent critical thinking and analytical skills. Her writing style is engaging and she consistently incorporates feedback from previous assignments.",
      "type": "Positive",
      "isExpanded": false
    },
    {
      "subject": "Social Studies",
      "teacher": "Mr. David Wilson",
      "date": "28 April 2024",
      "content": "Yogita is frequently missing assignment deadlines. Her work quality is satisfactory when submitted, but the consistent late submissions are impacting her overall performance.",
      "type": "Negative",
      "isExpanded": false
    },
    {
      "subject": "Hindi",
      "teacher": "Mrs. Priya Sharma",
      "date": "25 April 2024",
      "content": "Yogita has been an active participant in class discussions. Her pronunciation has improved significantly, and she shows genuine interest in cultural aspects of the language.",
      "type": "Positive",
      "isExpanded": false
    },
    {
      "subject": "Computer Science",
      "teacher": "Mr. Alan Turing",
      "date": "20 April 2024",
      "content": "Yogita demonstrates strong programming logic but needs to work on code documentation and commenting practices. Her algorithms are efficient but could be more readable.",
      "type": "Neutral",
      "isExpanded": false
    }
  ];

  void getData() {
    remarkList = remarkData.map((data) => RemarkModel.fromJson(data)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    remarkList[index].isExpanded = !remarkList[index].isExpanded;
    notifyListeners();
  }

  Color getTypeColor(String type) {
    switch (type) {
      case "Positive":
        return const Color(0xFF4CAF50);
      case "Negative":
        return const Color(0xFFF44336);
      case "Neutral":
        return const Color(0xFF2196F3);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
} 