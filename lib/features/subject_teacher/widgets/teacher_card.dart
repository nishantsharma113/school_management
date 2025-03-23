import 'package:flutter/material.dart';
import 'package:school_management/widgets/common/text_widget.dart';
import 'package:school_management/features/subject_teacher/model/teacher_model.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel teacher;
  final VoidCallback onTap;

  const TeacherCard({
    super.key,
    required this.teacher,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        children: [
          // Header - Always visible
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: teacher.isExpanded 
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                  : BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(teacher.imageUrl),
                    onBackgroundImageError: (exception, stackTrace) {
                      debugPrint('Error loading image: ${teacher.imageUrl}');
                    },
                    backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                    child: teacher.name.isNotEmpty 
                      ? Text(
                          teacher.name.substring(0, 1),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                          teacher.name,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          teacher.subject,
                          fontSize: 15,
                          color: Colors.grey[700] ?? Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          teacher.qualification,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    teacher.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),

          // Details - Visible when expanded
          if (teacher.isExpanded)
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  
                  // Contact Info
                  const TextWidget(
                    "Contact Information",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.email, teacher.email),
                  const SizedBox(height: 4),
                  _buildInfoRow(Icons.phone, teacher.phone),
                  const SizedBox(height: 16),
                  
                  // Classes Taught
                  const TextWidget(
                    "Classes Taught",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: teacher.classesTaught.map((className) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextWidget(
                          className,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  
                  // About
                  const TextWidget(
                    "About",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                    teacher.about,
                    fontSize: 14,
                    color: Colors.grey[800] ?? Colors.grey.shade800,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextWidget(
            text,
            fontSize: 14,
            color: Colors.grey[800] ?? Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
} 