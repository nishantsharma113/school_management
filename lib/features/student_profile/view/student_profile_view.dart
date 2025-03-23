import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/features/student_profile/provider/student_provider.dart';
import 'package:school_management/features/student_profile/widgets/academic_record_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Fetch data when screen initializes
    Future.microtask(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<StudentProvider>(context, listen: false).getData();
      });
    });
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Student Profile",
      ),
      body: Consumer<StudentProvider>(
        builder: (context, studentProvider, child) {
          if (studentProvider.student == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final student = studentProvider.student!;
          final avgPerformance = studentProvider.getAveragePerformance();
          
          return Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    // Profile Image and Basic Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(student.imageUrl),
                          onBackgroundImageError: (exception, stackTrace) {
                            debugPrint('Error loading image: ${student.imageUrl}');
                          },
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          child: student.name.isNotEmpty
                              ? Text(
                                  student.name.substring(0, 1),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                student.name,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              TextWidget(
                                "Class: ${student.className}-${student.section}",
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                              const SizedBox(height: 4),
                              TextWidget(
                                "Roll No: ${student.rollNumber}",
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Performance Indicator
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildPerformanceIndicator(
                            context, 
                            "Average", 
                            "${avgPerformance.toStringAsFixed(1)}%",
                            _getPerformanceColor(avgPerformance),
                          ),
                          _buildPerformanceIndicator(
                            context, 
                            "Latest", 
                            student.academicRecords.isNotEmpty 
                                ? "${student.academicRecords.first.percentage}%" 
                                : "N/A",
                            student.academicRecords.isNotEmpty 
                                ? _getPerformanceColor(student.academicRecords.first.percentage)
                                : Colors.grey,
                          ),
                          _buildPerformanceIndicator(
                            context, 
                            "Grade", 
                            student.academicRecords.isNotEmpty 
                                ? student.academicRecords.first.grade 
                                : "N/A",
                            student.academicRecords.isNotEmpty 
                                ? _getGradeColor(student.academicRecords.first.grade)
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Tab Bar
              TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(text: "Personal Info"),
                  Tab(text: "Academic Records"),
                  Tab(text: "Activities"),
                ],
              ),
              
              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Personal Info Tab
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _buildInfoCard(
                            "Personal Information",
                            [
                              _buildInfoRow("Name", student.name),
                              _buildInfoRow("Gender", student.gender),
                              _buildInfoRow("Date of Birth", student.dob),
                              _buildInfoRow("Blood Group", student.bloodGroup),
                              _buildInfoRow("Admission No", student.admissionNumber),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildInfoCard(
                            "Contact Information",
                            [
                              _buildInfoRow("Father's Name", student.fatherName),
                              _buildInfoRow("Mother's Name", student.motherName),
                              _buildInfoRow("Phone", student.contactNumber),
                              _buildInfoRow("Email", student.email),
                              _buildInfoRow("Address", student.address),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Academic Records Tab
                    student.academicRecords.isEmpty
                      ? const Center(child: Text("No academic records available"))
                      : ListView.builder(
                          itemCount: student.academicRecords.length,
                          itemBuilder: (context, index) {
                            return AcademicRecordCard(
                              record: student.academicRecords[index],
                            );
                          },
                        ),
                    
                    // Activities Tab
                    student.activities.isEmpty
                      ? const Center(child: Text("No activities available"))
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: student.activities.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        _getActivityIcon(student.activities[index]),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextWidget(
                                      student.activities[index],
                                      fontSize: 15,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildPerformanceIndicator(BuildContext context, String label, String value, Color color) {
    return Column(
      children: [
        TextWidget(
          label,
          fontSize: 12,
          color: Colors.grey,
        ),
        const SizedBox(height: 4),
        TextWidget(
          value,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ],
    );
  }
  
  Widget _buildInfoCard(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: TextWidget(
              label,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextWidget(
              value,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
  
  Color _getPerformanceColor(double percentage) {
    if (percentage >= 90) {
      return Colors.green;
    } else if (percentage >= 75) {
      return Colors.blue;
    } else if (percentage >= 60) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
  
  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+':
      case 'A':
        return Colors.green;
      case 'A-':
      case 'B+':
      case 'B':
        return Colors.blue;
      case 'B-':
      case 'C+':
      case 'C':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
  
  IconData _getActivityIcon(String activity) {
    if (activity.toLowerCase().contains("cricket") || 
       activity.toLowerCase().contains("sport") ||
       activity.toLowerCase().contains("team")) {
      return Icons.sports;
    } else if (activity.toLowerCase().contains("science") ||
              activity.toLowerCase().contains("math") ||
              activity.toLowerCase().contains("olympiad")) {
      return Icons.science;
    } else if (activity.toLowerCase().contains("debate") ||
              activity.toLowerCase().contains("speech")) {
      return Icons.mic;
    } else if (activity.toLowerCase().contains("volunteer") ||
              activity.toLowerCase().contains("service")) {
      return Icons.volunteer_activism;
    } else if (activity.toLowerCase().contains("art") ||
              activity.toLowerCase().contains("paint") ||
              activity.toLowerCase().contains("draw")) {
      return Icons.palette;
    } else {
      return Icons.emoji_events;
    }
  }
} 