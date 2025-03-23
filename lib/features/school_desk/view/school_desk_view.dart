import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_desk/provider/school_desk_provider.dart';
import 'package:school_management/features/school_desk/widgets/desk_item_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/common/loading_widget.dart';

class SchoolDeskScreen extends StatefulWidget {
  const SchoolDeskScreen({super.key});

  @override
  State<SchoolDeskScreen> createState() => _SchoolDeskScreenState();
}

class _SchoolDeskScreenState extends State<SchoolDeskScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SchoolDeskProvider>().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'School Desk',
        backgroundColor: AppColors.primary,
        titleColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.white,
            ),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: Consumer<SchoolDeskProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const LoadingWidget();
          }

          return RefreshIndicator(
            onRefresh: () async {
              provider.getData();
            },
            color: AppColors.primary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with notification count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your School Desk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      if (provider.totalNotifications > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${provider.totalNotifications} ${provider.totalNotifications == 1 ? 'notification' : 'notifications'}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Access all your school information in one place",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // New items section (if any)
                  if (provider.newItems.isNotEmpty) ...[
                    _buildSectionHeader("New", Icons.fiber_new),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.newItems.length,
                      itemBuilder: (context, index) {
                        return DeskItemCard(item: provider.newItems[index]);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                  
                  // Items with notifications section (if any)
                  if (provider.withNotifications.isNotEmpty) ...[
                    _buildSectionHeader("Updates", Icons.notifications_active),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.withNotifications.length,
                      itemBuilder: (context, index) {
                        return DeskItemCard(item: provider.withNotifications[index]);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                  
                  // All items section
                  _buildSectionHeader("All Items", Icons.dashboard),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.schoolDeskItems.length,
                    itemBuilder: (context, index) {
                      return DeskItemCard(item: provider.schoolDeskItems[index]);
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
  
  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
} 