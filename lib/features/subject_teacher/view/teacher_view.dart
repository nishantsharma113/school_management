import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/features/subject_teacher/provider/teacher_provider.dart';
import 'package:school_management/features/subject_teacher/widgets/teacher_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TeacherProvider>(context, listen: false).getData();
      _precacheImages();
    });
    
    // Add error handler for the image assets
    
  }
  
  void _precacheImages() {
    final teacherProvider = Provider.of<TeacherProvider>(context, listen: false);
    for (final teacher in teacherProvider.teacherData) {
      precacheImage(
        AssetImage(teacher['imageUrl']),
        context,
        onError: (exception, stackTrace) {
          debugPrint('Error loading image: ${teacher['imageUrl']}');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Subject Teachers",
        showtitle: true,
      ),
      body: Consumer<TeacherProvider>(
        builder: (context, teacherProvider, child) {
          if (teacherProvider.teacherList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: teacherProvider.teacherList.length,
            itemBuilder: (context, index) {
              final teacher = teacherProvider.teacherList[index];
              return TeacherCard(
                teacher: teacher,
                onTap: () {
                  teacherProvider.toggleExpanded(index);
                },
              );
            },
          );
        },
      ),
    );
  }
} 