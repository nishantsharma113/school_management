import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/exam_result/provider/exam_result_provider.dart';
import 'package:school_management/features/exam_result/widgets/exam_result_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class ExamResultScreen extends StatefulWidget {
  const ExamResultScreen({super.key});

  @override
  State<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamResultProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Exam Results",
        showtitle: true,
      ),
      body: Consumer<ExamResultProvider>(
        builder: (context, provider, child) {
          if (provider.examResultList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF473F97),
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Academic Year indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5FF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF473F97),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: const Color(0xFF473F97),
                      ),
                      const SizedBox(width: 8),
                      TextWidget(
                        "Academic Year: 2022-23",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF473F97),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Results list
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.examResultList.length,
                    itemBuilder: (context, index) {
                      final result = provider.examResultList[index];
                      return ExamResultCard(
                        result: result,
                        onTap: () => provider.toggleExpanded(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 