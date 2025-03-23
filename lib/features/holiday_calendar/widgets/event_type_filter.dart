import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/holiday_calendar/model/holiday_event_model.dart';

class EventTypeFilter extends StatelessWidget {
  final EventType? selectedType;
  final Function(EventType?) onTypeSelected;
  
  const EventTypeFilter({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(
            context: context,
            label: "All",
            icon: Icons.event_note,
            color: AppColors.primary,
            isSelected: selectedType == null,
            onTap: () => onTypeSelected(null),
          ),
          _buildFilterChip(
            context: context,
            label: "Holiday",
            icon: Icons.beach_access,
            color: Colors.red,
            isSelected: selectedType == EventType.holiday,
            onTap: () => onTypeSelected(EventType.holiday),
          ),
          _buildFilterChip(
            context: context,
            label: "Academic",
            icon: Icons.school,
            color: Colors.blue,
            isSelected: selectedType == EventType.academic,
            onTap: () => onTypeSelected(EventType.academic),
          ),
          _buildFilterChip(
            context: context,
            label: "Cultural",
            icon: Icons.celebration,
            color: Colors.orange,
            isSelected: selectedType == EventType.cultural,
            onTap: () => onTypeSelected(EventType.cultural),
          ),
          _buildFilterChip(
            context: context,
            label: "Sports",
            icon: Icons.sports,
            color: Colors.green,
            isSelected: selectedType == EventType.sports,
            onTap: () => onTypeSelected(EventType.sports),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : color,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 