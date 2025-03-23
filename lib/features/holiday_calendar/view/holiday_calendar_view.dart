import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/holiday_calendar/provider/holiday_calendar_provider.dart';
import 'package:school_management/features/holiday_calendar/widgets/event_card.dart';
import 'package:school_management/features/holiday_calendar/widgets/event_type_filter.dart';
import 'package:school_management/features/holiday_calendar/widgets/holiday_summary.dart';
import 'package:school_management/features/holiday_calendar/widgets/monthly_calendar.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class HolidayCalendarScreen extends StatefulWidget {
  const HolidayCalendarScreen({super.key});

  @override
  State<HolidayCalendarScreen> createState() => _HolidayCalendarScreenState();
}

class _HolidayCalendarScreenState extends State<HolidayCalendarScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HolidayCalendarProvider>(context, listen: false).fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Holiday & Event Calendar",
        showtitle: true,
        
      ),
      body: Consumer<HolidayCalendarProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
          
          return CustomScrollView(
            slivers: [
              // Calendar section
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // Current month indicator
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${_getMonthName(provider.selectedMonth)} ${provider.selectedYear}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Monthly calendar widget
                    MonthlyCalendar(
                      focusedDay: provider.focusedDate,
                      selectedDay: provider.selectedDate,
                      onDaySelected: provider.onDaySelected,
                      onPageChanged: provider.onPageChanged,
                      events: provider.eventsByDay,
                    ),
                    
                    // Event type filter
                    EventTypeFilter(
                      selectedType: provider.selectedEventType,
                      onTypeSelected: provider.setEventTypeFilter,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Upcoming holidays summary
                    HolidaySummary(
                      holidays: provider.currentMonthHolidays,
                    ),
                    
                    // Selected day's events header
                    if (provider.filteredEvents.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_note,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Events on ${_formatDate(provider.selectedDate)}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ],
                ),
              ),
              
              // Selected day's events list
              if (provider.filteredEvents.isEmpty) ...[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No events on ${_formatDate(provider.selectedDate)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final event = provider.filteredEvents[index];
                      return EventCard(
                        event: event,
                        onTap: () => provider.toggleEventExpanded(event.id),
                      );
                    },
                    childCount: provider.filteredEvents.length,
                  ),
                ),
                // Bottom padding
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add new event feature coming soon!"),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      "", "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return months[month];
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);
    
    if (dateToCheck == today) {
      return "Today";
    } else if (dateToCheck == tomorrow) {
      return "Tomorrow";
    } else if (dateToCheck == yesterday) {
      return "Yesterday";
    } else {
      return "${date.day} ${_getMonthName(date.month).substring(0, 3)} ${date.year}";
    }
  }
} 