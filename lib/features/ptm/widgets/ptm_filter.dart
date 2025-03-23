import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/ptm/provider/ptm_provider.dart';

class PTMFilter extends StatelessWidget {
  const PTMFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PTMProvider>();
    final currentFilter = provider.filterStatus;
    
    return Container(
      height: 50,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(
            context: context,
            label: "All",
            isSelected: currentFilter == "All",
            onTap: () => provider.setFilter("All"),
          ),
          _buildFilterChip(
            context: context,
            label: "Upcoming",
            isSelected: currentFilter == "Upcoming",
            onTap: () => provider.setFilter("Upcoming"),
            color: AppColors.primary,
          ),
          _buildFilterChip(
            context: context,
            label: "Completed",
            isSelected: currentFilter == "Completed",
            onTap: () => provider.setFilter("Completed"),
            color: AppColors.lightGreen,
          ),
          _buildFilterChip(
            context: context,
            label: "Cancelled",
            isSelected: currentFilter == "Cancelled",
            onTap: () => provider.setFilter("Cancelled"),
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
  
  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? color,
  }) {
    final chipColor = color ?? AppColors.primary;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12, top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : chipColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: chipColor,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : chipColor,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
} 