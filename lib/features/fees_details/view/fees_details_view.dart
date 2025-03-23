import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/fees_details/provider/fees_provider.dart';
import 'package:school_management/features/fees_details/widgets/fee_item.dart';
import 'package:school_management/features/fees_details/widgets/fee_tab_button.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class FeesDetailsScreen extends StatefulWidget {
  const FeesDetailsScreen({super.key});

  @override
  State<FeesDetailsScreen> createState() => _FeesDetailsScreenState();
}

class _FeesDetailsScreenState extends State<FeesDetailsScreen> {
  final List<String> feeTypes = [
    "School Fee",
    "Exam Fee",
    "Activity Fee",
    "Others"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FeesProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Fee Details",
        showtitle: true,
      ),
      body: Consumer<FeesProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // Fee type tabs
              Container(
                
                decoration: const BoxDecoration(
                  color: Colors.white,

                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: feeTypes.map((type) {
                      return FeeTabButton(
                        text: type,
                        isSelected: provider.selectedFeeType == type,
                        onTap: () => provider.changeSelectedFeeType(type),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              // Fee list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.feesList.length,
                  itemBuilder: (context, index) {
                    final fee = provider.feesList[index];
                    return FeeItemWidget(
                      fee: fee,
                      onToggleExpanded: () => provider.toggleExpanded(index),
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