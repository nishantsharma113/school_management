import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_map/model/location_model.dart';
import 'package:school_management/features/school_map/provider/school_map_provider.dart';

class LocationCard extends StatelessWidget {
  final LocationModel location;
  final bool isDetailed;
  final VoidCallback? onTap;
  
  const LocationCard({
    super.key,
    required this.location,
    this.isDetailed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SchoolMapProvider>();
    final color = provider.getLocationTypeColor(location.type);
    final icon = provider.getLocationTypeIcon(location.type);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: isDetailed ? 0 : 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha:  0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image section
            if (isDetailed) ...[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  location.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      color: color.withValues(alpha: 0.2),
                      child: Center(
                        child: Icon(
                          icon,
                          size: 64,
                          color: color.withValues(alpha: 0.7),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            
            // Content section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location type badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 14,
                          color: color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          provider.getLocationTypeDisplay(location.type),
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Location name
                  Text(
                    location.name,
                    style: TextStyle(
                      fontSize: isDetailed ? 18 : 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Floor info with icon
                  Row(
                    children: [
                      Icon(
                        Icons.layers,
                        size: 14,
                        color: AppColors.darkGray,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location.floor,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Description (only in detailed view or shortened in list view)
                  Text(
                    location.description,
                    maxLines: isDetailed ? 10 : 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                  
                  // Additional details in detailed view
                  if (isDetailed) ...[
                    const SizedBox(height: 16),
                    
                    // Opening hours if available
                    if (location.openingHours != null) ...[
                      _buildInfoRow(
                        icon: Icons.access_time,
                        label: "Opening Hours",
                        value: location.openingHours!,
                      ),
                      const SizedBox(height: 8),
                    ],
                    
                    // Tags as chips
                    const Text(
                      "Tags",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: location.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "#$tag",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.darkGray,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 