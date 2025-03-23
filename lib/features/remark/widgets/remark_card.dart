import 'package:flutter/material.dart';
import 'package:school_management/features/remark/model/remark_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class RemarkCard extends StatelessWidget {
  final RemarkModel remark;
  final VoidCallback onTap;
  
  const RemarkCard({
    super.key,
    required this.remark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color typeColor = _getTypeColor(remark.type);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: typeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(remark.isExpanded ? 0 : 16),
                  bottomRight: Radius.circular(remark.isExpanded ? 0 : 16),
                ),
                border: Border.all(
                  color: typeColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  _buildStatusIcon(remark.type),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          remark.subject,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: typeColor,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              size: 14,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 4),
                            TextWidget(
                              remark.teacher,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 4),
                            TextWidget(
                              remark.date,
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    remark.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: typeColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          
          // Content (expanded)
          if (remark.isExpanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border(
                  left: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1),
                  right: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1),
                  bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    "Teacher's Remark:",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                    remark.content,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextWidget(
                      remark.type,
                      fontSize: 12,
                      color: typeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(String type) {
    IconData iconData;
    Color color;
    
    switch (type) {
      case "Positive":
        iconData = Icons.thumb_up_outlined;
        color = const Color(0xFF4CAF50);
        break;
      case "Negative":
        iconData = Icons.thumb_down_outlined;
        color = const Color(0xFFF44336);
        break;
      case "Neutral":
        iconData = Icons.thumbs_up_down_outlined;
        color = const Color(0xFF2196F3);
        break;
      default:
        iconData = Icons.info_outline;
        color = const Color(0xFF9E9E9E);
    }
    
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: color,
        size: 20,
      ),
    );
  }
  
  Color _getTypeColor(String type) {
    switch (type) {
      case "Positive":
        return const Color(0xFF4CAF50);
      case "Negative":
        return const Color(0xFFF44336);
      case "Neutral":
        return const Color(0xFF2196F3);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
} 