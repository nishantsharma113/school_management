import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/student_profile/model/student_model.dart';

class StudentProvider extends ChangeNotifier {
  StudentModel? student;

  // Sample data for student
  Map<String, dynamic> studentData = {
    "name": "Rahul Sharma",
    "rollNumber": "101",
    "className": "X",
    "section": "A",
    "admissionNumber": "AD-2023-101",
    "dob": "15-Apr-2008",
    "gender": "Male",
    "fatherName": "Rajesh Sharma",
    "motherName": "Priya Sharma",
    "address": "123, Green Avenue, Delhi",
    "bloodGroup": "A+",
    "contactNumber": "+91 9876543210",
    "email": "rahul.sharma@student.edu",
    "imageUrl": "assets/images/student1.png",
    "academicRecords": [
      {
        "year": "2022-2023",
        "grade": "A",
        "percentage": 92.5,
        "remarks": "Excellent performance in Science and Mathematics"
      },
      {
        "year": "2021-2022",
        "grade": "A",
        "percentage": 90.2,
        "remarks": "Outstanding performance in all subjects"
      },
      {
        "year": "2020-2021",
        "grade": "A-",
        "percentage": 87.8,
        "remarks": "Good performance, needs improvement in Language"
      }
    ],
    "activities": [
      "School Cricket Team Captain",
      "Science Club Member",
      "Participated in National Science Olympiad",
      "Winner of Inter-school Debate Competition",
      "Volunteer for School Community Service Program"
    ],
    "isExpanded": false
  };

  void getData() {
    student = StudentModel.fromJson(studentData);
    notifyListeners();
  }

  double getAveragePerformance() {
    if (student == null || student!.academicRecords.isEmpty) {
      return 0.0;
    }
    
    double totalPercentage = 0.0;
    for (var record in student!.academicRecords) {
      totalPercentage += record.percentage;
    }
    
    return totalPercentage / student!.academicRecords.length;
  }

  void toggleExpanded() {
    if (student != null) {
      student!.isExpanded = !student!.isExpanded;
      notifyListeners();
    }
  }
} 