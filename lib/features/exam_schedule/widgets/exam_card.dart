import 'package:flutter/material.dart';
import 'package:school_management/features/exam_schedule/model/exam_schedule_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class ExamCard extends StatelessWidget {
  final ExamModel exam;

  const ExamCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Subject header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getExamTypeColor(exam.examType).withValues(alpha: 0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        exam.subject,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _getExamTypeColor(exam.examType),
                      ),
                      const SizedBox(height: 4),
                      TextWidget(
                        exam.time,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10, 
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _getExamTypeColor(exam.examType),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextWidget(
                    exam.examType,
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Exam details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _buildInfoRow(
                  Icons.location_on_outlined, 
                  'Venue:', 
                  exam.venue,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.timer_outlined, 
                  'Duration:', 
                  exam.duration,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey.shade700,
        ),
        const SizedBox(width: 8),
        TextWidget(
          label,
          fontSize: 14,
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: TextWidget(
            value,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Color _getExamTypeColor(String examType) {
    switch (examType.toLowerCase()) {
      case 'theory':
        return const Color(0xFF473F97);
      case 'practical':
        return const Color(0xFF12B264);
      case 'oral':
        return const Color(0xFFFF8C42);
      default:
        return const Color(0xFF473F97);
    }
  }
} 