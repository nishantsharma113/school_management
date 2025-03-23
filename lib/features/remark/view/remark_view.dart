import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/remark/model/remark_model.dart';
import 'package:school_management/features/remark/provider/remark_provider.dart';
import 'package:school_management/features/remark/widgets/remark_card.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class RemarkScreen extends StatefulWidget {
  const RemarkScreen({super.key});

  @override
  State<RemarkScreen> createState() => _RemarkScreenState();
}

class _RemarkScreenState extends State<RemarkScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RemarkProvider>(context, listen: false).getData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: "Teacher Remarks",
        showtitle: true,
      ),
      body: Consumer<RemarkProvider>(
        builder: (context, provider, _) {
          if (provider.remarkList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary stats banner
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      "Positive",
                      provider.remarkList.where((r) => r.type == "Positive").length.toString(),
                      const Color(0xFF4CAF50),
                    ),
                    _buildStatItem(
                      "Neutral",
                      provider.remarkList.where((r) => r.type == "Neutral").length.toString(),
                      const Color(0xFF2196F3),
                    ),
                    _buildStatItem(
                      "Negative",
                      provider.remarkList.where((r) => r.type == "Negative").length.toString(),
                      const Color(0xFFF44336),
                    ),
                  ],
                ),
              ),
              
              // Recent remarks heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      "Recent Remarks",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF473F97).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            size: 16,
                            color: Color(0xFF473F97),
                          ),
                          const SizedBox(width: 4),
                          const TextWidget(
                            "Filter",
                            fontSize: 14,
                            color: Color(0xFF473F97),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Remarks list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: provider.remarkList.length,
                  itemBuilder: (context, index) {
                    final RemarkModel remark = provider.remarkList[index];
                    return RemarkCard(
                      remark: remark,
                      onTap: () {
                        provider.toggleExpanded(index);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildStatItem(String label, String count, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            label == "Positive"
                ? Icons.thumb_up_outlined
                : label == "Negative"
                    ? Icons.thumb_down_outlined
                    : Icons.thumbs_up_down_outlined,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        TextWidget(
          count,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        const SizedBox(height: 4),
        TextWidget(
          label,
          fontSize: 12,
          color: Colors.black54,
        ),
      ],
    );
  }
} 