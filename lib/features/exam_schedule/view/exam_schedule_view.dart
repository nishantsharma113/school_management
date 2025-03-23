import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/exam_schedule/model/exam_schedule_model.dart';
import 'package:school_management/features/exam_schedule/provider/exam_schedule_provider.dart';
import 'package:school_management/features/exam_schedule/widgets/day_header.dart';
import 'package:school_management/features/exam_schedule/widgets/exam_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class ExamScheduleScreen extends StatefulWidget {
  const ExamScheduleScreen({super.key});

  @override
  State<ExamScheduleScreen> createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamScheduleProvider>(context, listen: false).getData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: "Exam Schedule",
        showtitle: true,
      ),
      body: Consumer<ExamScheduleProvider>(
        builder: (context, provider, _) {
          if (provider.examScheduleList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exam Info Header
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      provider.examTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF473F97),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF473F97),
                        ),
                        const SizedBox(width: 8),
                        TextWidget(
                          provider.examPeriod,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildExamTypeTag('Theory', const Color(0xFF473F97)),
                        const SizedBox(width: 8),
                        _buildExamTypeTag('Practical', const Color(0xFF12B264)),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Exam Schedule List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextWidget(
                  "Exam Schedule",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 12),
              
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: provider.examScheduleList.length,
                  itemBuilder: (context, index) {
                    final ExamScheduleModel schedule = provider.examScheduleList[index];
                    return Column(
                      children: [
                        DayHeader(
                          date: schedule.date,
                          day: schedule.day,
                          isExpanded: schedule.isExpanded,
                          onTap: () {
                            provider.toggleExpanded(index);
                          },
                        ),
                        if (schedule.isExpanded)
                          ...schedule.exams.map((exam) => ExamCard(exam: exam)),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildExamTypeTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          TextWidget(
            text,
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
} 