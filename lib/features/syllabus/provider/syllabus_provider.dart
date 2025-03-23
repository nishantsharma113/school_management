import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/syllabus/model/syllabus_model.dart';

class SyllabusProvider extends ChangeNotifier {
  List<SyllabusModel> syllabusList = [];
  
  // Sample data for syllabus
  List<Map<String, dynamic>> syllabusData = [
    {
      "subject": "Mathematics",
      "teacher": "Mr. Robert Smith",
      "units": [
        {
          "title": "Unit 1: Algebra",
          "topics": [
            "Linear Equations",
            "Quadratic Equations",
            "Polynomials",
            "Factorization"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 2: Geometry",
          "topics": [
            "Triangles",
            "Circles",
            "Coordinate Geometry",
            "Areas and Volumes"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 3: Trigonometry",
          "topics": [
            "Introduction to Trigonometry",
            "Trigonometric Ratios",
            "Heights and Distances",
            "Trigonometric Identities"
          ],
          "isCompleted": false
        },
        {
          "title": "Unit 4: Statistics",
          "topics": [
            "Mean, Median, Mode",
            "Standard Deviation",
            "Probability",
            "Data Interpretation"
          ],
          "isCompleted": false
        }
      ],
      "isExpanded": true
    },
    {
      "subject": "Science",
      "teacher": "Ms. Jessica Parker",
      "units": [
        {
          "title": "Unit 1: Physics",
          "topics": [
            "Mechanics",
            "Light",
            "Sound",
            "Electricity and Magnetism"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 2: Chemistry",
          "topics": [
            "Atoms and Molecules",
            "Chemical Reactions",
            "Acids, Bases and Salts",
            "Carbon and its Compounds"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 3: Biology",
          "topics": [
            "Cell Structure and Function",
            "Human Physiology",
            "Plants and Reproduction",
            "Ecology and Environment"
          ],
          "isCompleted": false
        }
      ],
      "isExpanded": false
    },
    {
      "subject": "English",
      "teacher": "Mrs. Sarah Johnson",
      "units": [
        {
          "title": "Unit 1: Grammar",
          "topics": [
            "Parts of Speech",
            "Tenses",
            "Active and Passive Voice",
            "Direct and Indirect Speech"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 2: Literature",
          "topics": [
            "Prose",
            "Poetry",
            "Drama",
            "Literary Devices"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 3: Writing Skills",
          "topics": [
            "Essay Writing",
            "Letter Writing",
            "Notice and Message Writing",
            "Report Writing"
          ],
          "isCompleted": false
        },
        {
          "title": "Unit 4: Reading Comprehension",
          "topics": [
            "Unseen Passages",
            "Factual Reading",
            "Literary Reading",
            "Note Making"
          ],
          "isCompleted": false
        }
      ],
      "isExpanded": false
    },
    {
      "subject": "Social Studies",
      "teacher": "Mr. David Wilson",
      "units": [
        {
          "title": "Unit 1: History",
          "topics": [
            "Ancient Civilizations",
            "Medieval History",
            "Modern History",
            "Contemporary History"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 2: Geography",
          "topics": [
            "Physical Geography",
            "Human Geography",
            "Economic Geography",
            "Environmental Geography"
          ],
          "isCompleted": false
        },
        {
          "title": "Unit 3: Civics",
          "topics": [
            "Democracy and Constitution",
            "Government and Politics",
            "Rights and Duties",
            "International Relations"
          ],
          "isCompleted": false
        }
      ],
      "isExpanded": false
    },
    {
      "subject": "Hindi",
      "teacher": "Mrs. Priya Sharma",
      "units": [
        {
          "title": "Unit 1: Grammar",
          "topics": [
            "Sandhi",
            "Samas",
            "Kriya",
            "Vachan"
          ],
          "isCompleted": true
        },
        {
          "title": "Unit 2: Literature",
          "topics": [
            "Poetry",
            "Prose",
            "Drama",
            "Hindi Writers and Poets"
          ],
          "isCompleted": false
        },
        {
          "title": "Unit 3: Writing Skills",
          "topics": [
            "Essay Writing",
            "Letter Writing",
            "Story Writing",
            "Report Writing"
          ],
          "isCompleted": false
        }
      ],
      "isExpanded": false
    }
  ];

  void getData() {
    syllabusList = syllabusData.map((e) => SyllabusModel.fromJson(e)).toList();
    notifyListeners();
  }

  void toggleExpanded(int index) {
    syllabusList[index].isExpanded = !syllabusList[index].isExpanded;
    notifyListeners();
  }
} 