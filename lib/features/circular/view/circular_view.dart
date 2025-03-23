import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/circular/provider/circular_provider.dart';
import 'package:school_management/features/circular/widgets/category_filter.dart';
import 'package:school_management/features/circular/widgets/circular_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({super.key});

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CircularProvider>().fetchCirculars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Circulars",
        onNotificationTap: () {
          context.go(AppRoutes.notification);
        },
      ),
      body: ColoredBox(
        color: Color(0xFF473F97),
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              _buildCircularSummary(),
              const CategoryFilter(),
              _buildCircularList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularSummary() {
    final provider = context.watch<CircularProvider>();
    final unreadCount = provider.unreadCount;
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          ),
          16.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "School Circulars",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                4.heightBox,
                Text(
                  "You have $unreadCount unread circular${unreadCount != 1 ? 's' : ''}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularList() {
    return Expanded(
      child: Consumer<CircularProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final circulars = provider.filteredCirculars;

          if (circulars.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  16.heightBox,
                  Text(
                    "No circulars found",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  8.heightBox,
                  Text(
                    "There are no circulars in this category",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: circulars.length,
            itemBuilder: (context, index) {
              final circular = circulars[index];
              return CircularCard(
                circular: circular,
              );
            },
          );
        },
      ),
    );
  }
} 