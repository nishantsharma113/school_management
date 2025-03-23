import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/exam_result/model/exam_result_model.dart';

class ExamResultProvider extends ChangeNotifier {
  List<ExamResultModel> examResultList = [];
  
  // Sample data for exam results
  List<Map<String, dynamic>> examResultData = [
    {
      "examType": "Mid Term Exam",
      "examDate": "May 2023",
      "totalMarks": 500.0,
      "obtainedMarks": 436.0,
      "grade": "A",
      "subjects": [
        {
          "subject": "English",
          "maxMarks": 100.0,
          "obtainedMarks": 85.0,
          "grade": "A",
          "teacherComment": "Good performance in essays, needs improvement in grammar."
        },
        {
          "subject": "Mathematics",
          "maxMarks": 100.0,
          "obtainedMarks": 92.0,
          "grade": "A+",
          "teacherComment": "Excellent work in algebra and calculus."
        },
        {
          "subject": "Science",
          "maxMarks": 100.0,
          "obtainedMarks": 88.0,
          "grade": "A",
          "teacherComment": "Strong understanding of concepts, good practical work."
        },
        {
          "subject": "Social Studies",
          "maxMarks": 100.0,
          "obtainedMarks": 78.0,
          "grade": "B+",
          "teacherComment": "Good grasp of history, needs to improve in geography."
        },
        {
          "subject": "Hindi",
          "maxMarks": 100.0,
          "obtainedMarks": 93.0,
          "grade": "A+",
          "teacherComment": "Excellent vocabulary and creative writing skills."
        }
      ],
      "isExpanded": true
    },
    {
      "examType": "Unit Test - 3",
      "examDate": "April 2023",
      "totalMarks": 200.0,
      "obtainedMarks": 172.0,
      "grade": "A",
      "subjects": [
        {
          "subject": "English",
          "maxMarks": 50.0,
          "obtainedMarks": 42.0,
          "grade": "A",
          "teacherComment": "Good comprehension skills."
        },
        {
          "subject": "Mathematics",
          "maxMarks": 50.0,
          "obtainedMarks": 46.0,
          "grade": "A+",
          "teacherComment": "Excellent problem-solving ability."
        },
        {
          "subject": "Science",
          "maxMarks": 50.0,
          "obtainedMarks": 44.0,
          "grade": "A",
          "teacherComment": "Good understanding of concepts."
        },
        {
          "subject": "Hindi",
          "maxMarks": 50.0,
          "obtainedMarks": 40.0,
          "grade": "A",
          "teacherComment": "Good grammar and vocabulary."
        }
      ],
      "isExpanded": false
    },
    {
      "examType": "Unit Test - 2",
      "examDate": "February 2023",
      "totalMarks": 200.0,
      "obtainedMarks": 168.0,
      "grade": "A",
      "subjects": [
        {
          "subject": "English",
          "maxMarks": 50.0,
          "obtainedMarks": 40.0,
          "grade": "A",
          "teacherComment": "Good writing skills."
        },
        {
          "subject": "Mathematics",
          "maxMarks": 50.0,
          "obtainedMarks": 45.0,
          "grade": "A+",
          "teacherComment": "Excellent in geometry."
        },
        {
          "subject": "Science",
          "maxMarks": 50.0,
          "obtainedMarks": 42.0,
          "grade": "A",
          "teacherComment": "Good practical skills."
        },
        {
          "subject": "Hindi",
          "maxMarks": 50.0,
          "obtainedMarks": 41.0,
          "grade": "A",
          "teacherComment": "Good creative writing."
        }
      ],
      "isExpanded": false
    },
    {
      "examType": "Unit Test - 1",
      "examDate": "December 2022",
      "totalMarks": 200.0,
      "obtainedMarks": 164.0,
      "grade": "A",
      "subjects": [
        {
          "subject": "English",
          "maxMarks": 50.0,
          "obtainedMarks": 38.0,
          "grade": "B+",
          "teacherComment": "Good effort, needs improvement in grammar."
        },
        {
          "subject": "Mathematics",
          "maxMarks": 50.0,
          "obtainedMarks": 44.0,
          "grade": "A",
          "teacherComment": "Strong in arithmetic."
        },
        {
          "subject": "Science",
          "maxMarks": 50.0,
          "obtainedMarks": 43.0,
          "grade": "A",
          "teacherComment": "Good theoretical knowledge."
        },
        {
          "subject": "Hindi",
          "maxMarks": 50.0,
          "obtainedMarks": 39.0,
          "grade": "B+",
          "teacherComment": "Good reading skills, needs work on writing."
        }
      ],
      "isExpanded": false
    }
  ];

  void getData() {
    examResultList = examResultData.map((e) => ExamResultModel.fromJson(e)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    for (int i = 0; i < examResultList.length; i++) {
      examResultList[i].isExpanded = (i == index);
    }
    notifyListeners();
  }
} 