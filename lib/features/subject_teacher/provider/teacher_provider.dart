import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/subject_teacher/model/teacher_model.dart';

class TeacherProvider extends ChangeNotifier {
  List<TeacherModel> teacherList = [];

  // Sample data for teachers
  List<Map<String, dynamic>> teacherData = [
    {
      "name": "Mr. Robert Smith",
      "subject": "Mathematics",
      "qualification": "M.Sc. in Mathematics, B.Ed",
      "experience": "15 years",
      "email": "robert.smith@school.edu",
      "phone": "+91 9876543210",
      "imageUrl": "assets/images/teacher1.png",
      "classesTaught": ["VIII A", "IX B", "X A", "X B"],
      "about": "Mr. Robert Smith is an experienced mathematics teacher with 15 years of teaching experience. He specializes in making complex mathematical concepts easy to understand through practical examples and real-world applications. He has received several awards for excellence in teaching and has been recognized for his innovative teaching methodologies.",
      "isExpanded": true
    },
    {
      "name": "Ms. Jessica Parker",
      "subject": "Science",
      "qualification": "M.Sc. in Physics, Ph.D",
      "experience": "12 years",
      "email": "jessica.parker@school.edu",
      "phone": "+91 9876543211",
      "imageUrl": "assets/images/teacher2.png",
      "classesTaught": ["VII A", "VII B", "VIII A", "VIII B"],
      "about": "Ms. Jessica Parker holds a Ph.D in Physics and is passionate about making science education accessible and engaging for all students. She encourages students to participate in various science competitions and has guided many science projects that have won at national level competitions. She believes in practical, hands-on learning and regularly conducts experiments in her classes.",
      "isExpanded": false
    },
    {
      "name": "Mrs. Sarah Johnson",
      "subject": "English",
      "qualification": "M.A. in English Literature, B.Ed",
      "experience": "10 years",
      "email": "sarah.johnson@school.edu",
      "phone": "+91 9876543212",
      "imageUrl": "assets/images/teacher3.png",
      "classesTaught": ["IX A", "IX B", "X A", "X B"],
      "about": "Mrs. Sarah Johnson has been teaching English for over a decade with a focus on developing strong communication skills and critical thinking through literature analysis. She organizes the annual inter-school debate and literary competitions. She is known for her creative teaching methods that make reading and writing enjoyable for students of all abilities.",
      "isExpanded": false
    },
    {
      "name": "Mr. David Wilson",
      "subject": "Social Studies",
      "qualification": "M.A. in History, B.Ed",
      "experience": "8 years",
      "email": "david.wilson@school.edu",
      "phone": "+91 9876543213",
      "imageUrl": "assets/images/teacher4.png",
      "classesTaught": ["VIII A", "VIII B", "IX A", "IX B"],
      "about": "Mr. David Wilson makes history and social studies come alive through his storytelling approach to teaching. He regularly organizes field trips to historical sites and museums to enhance students' understanding of the subject. He is also the coordinator for the school's Model United Nations program, helping students develop a global perspective on current events.",
      "isExpanded": false
    },
    {
      "name": "Mrs. Priya Sharma",
      "subject": "Hindi",
      "qualification": "M.A. in Hindi Literature",
      "experience": "14 years",
      "email": "priya.sharma@school.edu",
      "phone": "+91 9876543214",
      "imageUrl": "assets/images/teacher5.png",
      "classesTaught": ["VII A", "VII B", "X A", "X B"],
      "about": "Mrs. Priya Sharma has been teaching Hindi language and literature for over 14 years. She is dedicated to preserving and promoting cultural heritage through language education. She organizes cultural events, poetry recitations, and drama performances to make learning Hindi an immersive experience. She has published several articles on effective methods of teaching Hindi to modern students.",
      "isExpanded": false
    },
    {
      "name": "Mr. Alan Turing",
      "subject": "Computer Science",
      "qualification": "M.Tech in Computer Science",
      "experience": "6 years",
      "email": "alan.turing@school.edu",
      "phone": "+91 9876543215",
      "imageUrl": "assets/images/teacher6.png",
      "classesTaught": ["IX A", "IX B", "X A", "X B"],
      "about": "Mr. Alan Turing is a dynamic computer science teacher who combines theoretical knowledge with practical application. He regularly conducts coding workshops and hackathons to encourage students to develop technical skills. Under his guidance, several students have developed innovative applications and have participated in national-level coding competitions. He emphasizes the importance of ethical considerations in technology.",
      "isExpanded": false
    }
  ];

  void getData() {
    teacherList = teacherData.map((data) => TeacherModel.fromJson(data)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    teacherList[index].isExpanded = !teacherList[index].isExpanded;
    notifyListeners();
  }
} 