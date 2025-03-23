import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/ptm/model/ptm_model.dart';
import 'package:school_management/features/ptm/provider/ptm_provider.dart';

class PTMCard extends StatelessWidget {
  final PTMModel ptm;
  final VoidCallback onTap;

  const PTMCard({
    super.key,
    required this.ptm,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<PTMProvider>();
    final statusColor = provider.getStatusColor(ptm.status);
    final statusIcon = provider.getStatusIcon(ptm.status);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: statusColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Header with teacher name and subject
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            statusIcon,
                            color: statusColor,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ptm.teacherName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ptm.subject,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        ptm.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Date and time row
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoItem(
                          icon: Icons.calendar_today,
                          label: "Date",
                          value: ptm.date,
                        ),
                      ),
                      Expanded(
                        child: _buildInfoItem(
                          icon: Icons.access_time,
                          label: "Time",
                          value: ptm.time,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Venue and status
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoItem(
                          icon: Icons.location_on,
                          label: "Venue",
                          value: ptm.venue,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            ptmStatusToString(ptm.status).toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Expanded section with notes
          if (ptm.isExpanded && ptm.notes != null) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notes:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ptm.notes!,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Action buttons for upcoming meetings
                  if (ptm.status == PTMStatus.upcoming) ...[
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.calendar_month),
                            label: const Text("Add to Calendar"),
                            onPressed: () {
                              // Add to calendar logic
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.chat_outlined),
                            label: const Text("Message"),
                            onPressed: () {
                              // Message teacher logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  
                  // Completed meeting feedback button
                  if (ptm.status == PTMStatus.completed) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.feedback_outlined),
                      label: const Text("Provide Feedback"),
                      onPressed: () {
                        // Feedback logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGreen,
                        foregroundColor: AppColors.white,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                  
                  // Cancelled meeting reschedule button
                  if (ptm.status == PTMStatus.cancelled) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text("Request Rescheduling"),
                      onPressed: () {
                        // Reschedule logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: AppColors.white,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildInfoItem({
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
                  fontSize: 12,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 