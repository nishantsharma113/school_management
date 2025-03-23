import 'package:flutter/material.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class DayHeader extends StatelessWidget {
  final String date;
  final String day;
  final bool isExpanded;
  final VoidCallback onTap;

  const DayHeader({
    super.key,
    required this.date,
    required this.day,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF473F97),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  date,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                TextWidget(
                  day,
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
} 