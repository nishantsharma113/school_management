import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_timing/model/school_timing_model.dart';
import 'package:school_management/features/school_timing/provider/school_timing_provider.dart';
import 'package:school_management/features/school_timing/widgets/time_slot_card.dart';
import 'package:school_management/features/school_timing/widgets/timing_day_header.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/common/loading_widget.dart';

class SchoolTimingScreen extends StatefulWidget {
  const SchoolTimingScreen({super.key});

  @override
  State<SchoolTimingScreen> createState() => _SchoolTimingScreenState();
}

class _SchoolTimingScreenState extends State<SchoolTimingScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SchoolTimingProvider>().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'School Timing',
        
        showtitle: true,
        
        
      ),
      body: Consumer<SchoolTimingProvider>(
        builder: (context, provider, child) {
          if (provider.schoolTimingList.isEmpty) {
            return const LoadingWidget();
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "School Timing Schedule",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "The schedule below shows the daily timing of classes and breaks throughout the week.",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Schedule list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.schoolTimingList.length,
                    itemBuilder: (context, index) {
                      SchoolTimingModel dayTiming = provider.schoolTimingList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Day header
                          TimingDayHeader(
                            dayTiming: dayTiming,
                            index: index,
                            onToggle: provider.toggleExpanded,
                          ),
                          
                          // Time slots list (visible only when expanded)
                          if (dayTiming.isExpanded)
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                              child: Column(
                                children: dayTiming.timeSlots.map((timeSlot) {
                                  return TimeSlotCard(timeSlot: timeSlot);
                                }).toList(),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
 
  
  
} 