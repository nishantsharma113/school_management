import 'package:flutter/material.dart';
import 'package:school_management/core/widgets/text_widget.dart';
import 'package:school_management/features/syllabus/model/syllabus_model.dart';

class SyllabusCard extends StatelessWidget {
  final SyllabusModel syllabus;
  final VoidCallback onTap;

  const SyllabusCard({
    super.key,
    required this.syllabus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: syllabus.subject,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          text: "Teacher: ${syllabus.teacher}",
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    syllabus.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            
            // Expandable content
            if (syllabus.isExpanded)
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...syllabus.units.map((unit) => _buildUnitItem(context, unit)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitItem(BuildContext context, UnitModel unit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unit Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: unit.isCompleted 
                  ? Colors.green.withValues(alpha: 0.2)
                  : Colors.orange.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextWidget(
                    text: unit.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: unit.isCompleted 
                        ? Colors.green.withValues(alpha: 0.8)
                        : Colors.orange.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextWidget(
                    text: unit.isCompleted ? "Completed" : "In Progress",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          // Topics
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: "Topics:",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 8),
                ...unit.topics.map((topic) => _buildTopicItem(topic)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicItem(String topic) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 8,
            color: Colors.black54,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextWidget(
              text: topic,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 