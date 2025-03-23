import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/ptm/model/ptm_model.dart';
import 'package:school_management/features/ptm/provider/ptm_provider.dart';
import 'package:school_management/features/ptm/widgets/ptm_card.dart';
import 'package:school_management/features/ptm/widgets/ptm_filter.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/common/loading_widget.dart';

class PTMScreen extends StatefulWidget {
  const PTMScreen({super.key});

  @override
  State<PTMScreen> createState() => _PTMScreenState();
}

class _PTMScreenState extends State<PTMScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch PTM data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PTMProvider>().fetchPTMData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Parent-Teacher Meetings",
        showtitle: true,
      ),
      body: Consumer<PTMProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const LoadingWidget();
          }

          // Count meetings by status
          final upcomingCount = provider.ptmList.where((ptm) => ptm.status == PTMStatus.upcoming).length;
          final completedCount = provider.ptmList.where((ptm) => ptm.status == PTMStatus.completed).length;
          final cancelledCount = provider.ptmList.where((ptm) => ptm.status == PTMStatus.cancelled).length;
          
          return Column(
            children: [
              // Summary section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PTM Summary",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildSummaryItem(
                          count: upcomingCount,
                          label: "Upcoming",
                          color: AppColors.primary,
                          icon: Icons.event,
                        ),
                        _buildSummaryItem(
                          count: completedCount,
                          label: "Completed",
                          color: AppColors.lightGreen,
                          icon: Icons.check_circle_outline,
                        ),
                        _buildSummaryItem(
                          count: cancelledCount,
                          label: "Cancelled",
                          color: AppColors.red,
                          icon: Icons.cancel_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      upcomingCount > 0
                          ? "You have $upcomingCount upcoming parent-teacher meetings."
                          : "You have no upcoming parent-teacher meetings.",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Filter section
              const PTMFilter(),
              
              // List of meetings
              Expanded(
                child: provider.filteredList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 64,
                              color: AppColors.lightGray,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "No ${provider.filterStatus.toLowerCase()} meetings found",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: provider.filteredList.length,
                        itemBuilder: (context, index) {
                          final ptm = provider.filteredList[index];
                          return PTMCard(
                            ptm: ptm,
                            onTap: () => provider.toggleExpanded(ptm.id),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          _showRequestPTMDialog();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSummaryItem({
    required int count,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRequestPTMDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Request PTM",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Subject",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Reason for Meeting",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: AppColors.darkGray),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Request PTM logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("PTM request submitted successfully"),
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text("Submit Request"),
          ),
        ],
      ),
    );
  }
} 