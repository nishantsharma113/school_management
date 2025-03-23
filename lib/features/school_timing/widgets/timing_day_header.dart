import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_timing/model/school_timing_model.dart';

class TimingDayHeader extends StatelessWidget {
  final SchoolTimingModel dayTiming;
  final int index;
  final Function(int) onToggle;
  
  const TimingDayHeader({
    super.key,
    required this.dayTiming,
    required this.index,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onToggle(index),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: AppColors.white,
                  size: 18,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    dayTiming.day,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  dayTiming.isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 