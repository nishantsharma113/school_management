import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/circular/model/circular_model.dart';
import 'package:school_management/features/circular/provider/circular_provider.dart';

class CircularSummary extends StatelessWidget {
  final List<CircularModel> circulars;
  final int unreadCount;
  
  const CircularSummary({
    super.key,
    required this.circulars,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CircularProvider>(context, listen: false);
    final totalCirculars = circulars.length;
    final importantCount = circulars.where((c) => c.isImportant).length;
    
    // Calculate category counts
    final Map<String, int> categoryCounts = {};
    for (final circular in circulars) {
      categoryCounts[circular.category] = (categoryCounts[circular.category] ?? 0) + 1;
    }
    
    // Get top 3 categories
    final sortedCategories = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topCategories = sortedCategories.take(3).toList();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "School Circulars",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Stay updated with all school announcements",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildSummaryItem(
                      icon: Icons.notifications_active,
                      color: AppColors.primary,
                      title: "Total",
                      value: totalCirculars.toString(),
                    ),
                    const SizedBox(width: 12),
                    _buildSummaryItem(
                      icon: Icons.mark_email_unread,
                      color: AppColors.orange,
                      title: "Unread",
                      value: unreadCount.toString(),
                    ),
                    const SizedBox(width: 12),
                    _buildSummaryItem(
                      icon: Icons.priority_high,
                      color: AppColors.red,
                      title: "Important",
                      value: importantCount.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Top Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...topCategories.map((entry) {
                      final category = entry.key;
                      final count = entry.value;
                      final percentage = (count / totalCirculars * 100).toInt();
                      
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: provider.getCategoryColor(category).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                provider.getCategoryIcon(category),
                                color: provider.getCategoryColor(category),
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        category,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        "$count ($percentage%)",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: LinearProgressIndicator(
                                      value: count / totalCirculars,
                                      backgroundColor: Colors.grey.withValues(alpha: 0.1),
                                      color: provider.getCategoryColor(category),
                                      minHeight: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSummaryItem({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 14,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: color,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: color.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 