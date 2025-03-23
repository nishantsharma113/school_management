import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_timing/model/school_timing_model.dart';

class TimeSlotCard extends StatelessWidget {
  final TimeSlotModel timeSlot;
  
  const TimeSlotCard({
    super.key,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: timeSlot.isBreak 
            ? AppColors.lightGreen.withValues(alpha:0.2)
            : AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: timeSlot.isBreak 
              ? AppColors.lightGreen 
              : AppColors.lightGray,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: timeSlot.isBreak 
                        ? AppColors.lightGreen 
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    timeSlot.startTime,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (timeSlot.endTime.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: timeSlot.isBreak 
                          ? AppColors.lightGreen.withValues(alpha: 0.7) 
                          : AppColors.primary.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      timeSlot.endTime,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            
            // Vertical line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: 2,
              height: 60,
              decoration: BoxDecoration(
                color: timeSlot.isBreak 
                    ? AppColors.lightGreen.withValues(alpha: 0.5) 
                    : AppColors.primary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            
            // Activity details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        timeSlot.isBreak 
                            ? Icons.free_breakfast 
                            : Icons.school,
                        size: 16,
                        color: timeSlot.isBreak 
                            ? AppColors.lightGreen 
                            : AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          timeSlot.activity,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeSlot.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGray,
                    ),
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