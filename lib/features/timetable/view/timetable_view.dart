import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/timetable/provider/timetable_provider.dart';
import 'package:school_management/features/timetable/widgets/day_tab_button.dart';
import 'package:school_management/features/timetable/widgets/period_item.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TimetableProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Class Timetable",
        showtitle: true,
      ),
      body: Consumer<TimetableProvider>(
        builder: (context, provider, child) {
          if (provider.timetableList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF473F97),
              ),
            );
          }

          // Find the selected day model
          final selectedDayModel = provider.timetableList.firstWhere(
            (model) => model.day == provider.selectedDay,
            orElse: () => provider.timetableList.first,
          );

          return Column(
            children: [
              // Day selection tabs
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: weekDays.map((day) {
                      return DayTabButton(
                        day: day,
                        isSelected: provider.selectedDay == day,
                        onTap: () => provider.selectDay(day),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              // Header for the current day
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    TextWidget(
                      provider.selectedDay,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF473F97),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5FF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF473F97),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: const Color(0xFF473F97),
                          ),
                          const SizedBox(width: 8),
                          TextWidget(
                            "May 2023",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF473F97),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Periods list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: selectedDayModel.periods.length,
                  itemBuilder: (context, index) {
                    final period = selectedDayModel.periods[index];
                    return PeriodItem(period: period);
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