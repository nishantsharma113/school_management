import 'package:flutter/material.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class FeeTabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FeeTabButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextWidget(
              text,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.red : Colors.black54,
            ),
          ),
          if (isSelected)
            Container(
              height: 3,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            )
        ],
      ),
    );
  }
} 