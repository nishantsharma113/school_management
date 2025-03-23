import 'package:flutter/material.dart';
import 'package:school_management/features/timetable/model/timetable_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class PeriodItem extends StatelessWidget {
  final PeriodModel period;

  const PeriodItem({
    super.key,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    // Different styling based on period type
    Color bgColor;
    Color textColor;
    Color timeBoxColor;
    IconData? icon;

    switch (period.periodType) {
      case "break":
        bgColor = const Color(0xFFFFF1EC);
        textColor = Colors.orange;
        timeBoxColor = Colors.orange.withValues(alpha: 0.2);
        icon = Icons.free_breakfast;
        break;
      case "lunch":
        bgColor = const Color(0xFFFFF1EC);
        textColor = Colors.orange;
        timeBoxColor = Colors.orange.withValues(alpha:  0.2);
        icon = Icons.lunch_dining;
        break;
      case "class":
      default:
        bgColor = const Color(0xFFFEF8FF);
        textColor = const Color(0xFF473F97);
        timeBoxColor = const Color(0xFFECE5FF);
        icon = null;
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
        child: Row(
          children: [
            Container(
              width: 65,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                color: timeBoxColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    period.time.split(" - ")[0],
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  if (period.periodType == "class") 
                    const SizedBox(height: 4),
                  if (period.periodType == "class") 
                    TextWidget(
                      period.time.split(" - ")[1],
                      fontSize: 13,
                      color: textColor.withValues(alpha: 0.7),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (icon != null) 
                        Icon(icon, color: textColor, size: 18),
                      if (icon != null) 
                        const SizedBox(width: 8),
                      TextWidget(
                        period.subject,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ],
                  ),
                  if (period.teacher.isNotEmpty)
                    const SizedBox(height: 4),
                  if (period.teacher.isNotEmpty)
                    TextWidget(
                      period.teacher,
                      fontSize: 14,
                      color: Colors.grey,
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