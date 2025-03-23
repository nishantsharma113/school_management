import 'package:flutter/material.dart';
import 'package:school_management/features/exam_schedule/model/exam_schedule_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class ExamItem extends StatelessWidget {
  final ExamModel exam;

  const ExamItem({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    // Different styling based on exam type
    Color bgColor;
    Color textColor;
    IconData? icon;

    switch (exam.examType) {
      case "Practical":
        bgColor = const Color(0xFFF0F7FF);
        textColor = Colors.blue;
        icon = Icons.science_outlined;
        break;
      case "Oral":
        bgColor = const Color(0xFFFFF1EC);
        textColor = Colors.orange;
        icon = Icons.record_voice_over_outlined;
        break;
      case "Theory":
      default:
        bgColor = const Color(0xFFF5F5FF);
        textColor = const Color(0xFF473F97);
        icon = Icons.edit_outlined;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: textColor, size: 20),
                const SizedBox(width: 8),
                TextWidget(
                  exam.subject,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: textColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextWidget(
                    exam.examType,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey, size: 16),
                const SizedBox(width: 4),
                TextWidget(
                  exam.time,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const TextWidget(
              "Venue",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            const SizedBox(height: 4),
            TextWidget(
              exam.venue,
              fontSize: 14,
              color: Colors.black54,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            const TextWidget(
              "Duration",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            const SizedBox(height: 4),
            TextWidget(
              exam.duration,
              fontSize: 14,
              color: Colors.black54,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFFE082), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFFFF9800), size: 18),
                      SizedBox(width: 8),
                      TextWidget(
                        "Important Remark",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF9800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const TextWidget(
                    "Bring all necessary stationery items. Electronic devices are not permitted during the examination. Arrive 15 minutes before the scheduled time.",
                    fontSize: 13,
                    color: Color(0xFF5D4037),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 