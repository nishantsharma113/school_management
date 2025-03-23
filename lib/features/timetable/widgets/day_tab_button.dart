import 'package:flutter/material.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class DayTabButton extends StatelessWidget {
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const DayTabButton({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF473F97) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextWidget(
          day.substring(0, 3), // Show first 3 letters (Mon, Tue, etc.)
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFF473F97),
        ),
      ),
    );
  }
} 