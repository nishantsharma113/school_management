import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/features/syllabus/provider/syllabus_provider.dart';
import 'package:school_management/features/syllabus/widgets/syllabus_card.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SyllabusProvider>(context, listen: false).getData();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(
        title: "Syllabus",
        showtitle: true,
      ),
      body: Consumer<SyllabusProvider>(
        builder: (context, provider, _) {
          if (provider.syllabusList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return Column(
            children: [
              // Academic year info
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Academic Year: 2024-2025",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Syllabus List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: provider.syllabusList.length,
                  itemBuilder: (context, index) {
                    final syllabus = provider.syllabusList[index];
                    return SyllabusCard(
                      syllabus: syllabus,
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
} 