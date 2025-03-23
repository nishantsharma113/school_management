import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_map/model/location_model.dart';
import 'package:school_management/features/school_map/provider/school_map_provider.dart';

class LocationTypeFilter extends StatelessWidget {
  const LocationTypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SchoolMapProvider>();
    
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          FilterChip(
            label: 'All',
            isSelected: provider.selectedType == null,
            icon: Icons.location_on,
            onTap: () => provider.filterByType(null),
          ),
          ...LocationType.values.map((type) => FilterChip(
            label: provider.getLocationTypeDisplay(type),
            isSelected: provider.selectedType == type,
            icon: provider.getLocationTypeIcon(type),
            color: provider.getLocationTypeColor(type),
            onTap: () => provider.filterByType(type),
          )),
        ],
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  const FilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon = Icons.place,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? chipColor : AppColors.lightGray,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: chipColor.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.white : chipColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.black,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 