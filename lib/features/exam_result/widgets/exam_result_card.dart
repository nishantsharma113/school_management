import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/exam_result/model/exam_result_model.dart';

class ExamResultCard extends StatelessWidget {
  final ExamResultModel result;
  final VoidCallback onTap;

  const ExamResultCard({
    super.key,
    required this.result,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header section
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF473F97),
                borderRadius: result.isExpanded 
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )
                    : BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          result.examType,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          result.examDate,
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        "Grade: ${result.grade}",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      TextWidget(
                        "${result.obtainedMarks}/${result.totalMarks}",
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    result.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          
          // Details section
          if (result.isExpanded)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // Percentage and grade row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBox(
                        context,
                        "Percentage",
                        "${((result.obtainedMarks / result.totalMarks) * 100).toStringAsFixed(1)}%",
                        const Color(0xFFF5F5FF),
                        const Color(0xFF473F97),
                      ),
                      _buildInfoBox(
                        context,
                        "Grade",
                        result.grade,
                        const Color(0xFFF5F5FF),
                        const Color(0xFF473F97),
                      ),
                      _buildInfoBox(
                        context,
                        "Total",
                        "${result.obtainedMarks}/${result.totalMarks}",
                        const Color(0xFFF5F5FF),
                        const Color(0xFF473F97),
                      ),
                    ],
                  ),
                  
                  // Subject results
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  const TextWidget(
                    "Subject Results",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF473F97),
                  ),
                  const SizedBox(height: 12),
                  
                  // Header row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextWidget(
                            "Subject",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextWidget(
                            "Marks",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: TextWidget(
                            "Grade",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  const Divider(height: 0),
                  
                  // Subject rows
                  ...result.subjects.map((subject) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextWidget(
                                subject.subject,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Expanded(
                              child: TextWidget(
                                "${subject.obtainedMarks.toInt()}/${subject.maxMarks.toInt()}",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: _getGradeColor(subject.grade),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: TextWidget(
                                    subject.grade,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (subject.teacherComment.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                "Comment: ",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: TextWidget(
                                  subject.teacherComment,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const Divider(height: 0),
                    ],
                  )),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, String label, String value, Color bgColor, Color textColor) {
    return Container(
      width: context.screenWidth * 0.26,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextWidget(
            label,
            fontSize: 12,
            color: textColor.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 4),
          TextWidget(
            value,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case "A+":
        return Colors.purple;
      case "A":
        return Colors.blue;
      case "B+":
        return Colors.green;
      case "B":
        return Colors.teal;
      case "C":
        return Colors.amber;
      case "D":
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
} 