import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/attendance/provider/attendance_controller.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    final leaveDates = attendanceProvider.leaveDates;
    final absentDates = attendanceProvider.absentDates;
    final totalDays = 30;
    final presentDays = totalDays - (leaveDates.length + absentDates.length);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Attendance",
        showtitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2024, 4, 1),
              lastDay: DateTime.utc(2024, 4, 30),
              focusedDay: DateTime.utc(2024, 4, 1),
              calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                 leftChevronVisible: false,
                 rightChevronVisible: false,
                  titleCentered: false,
                
                  headerMargin: EdgeInsets.all(12),
                  titleTextStyle: TextStyle( color: Color.fromARGB(193, 70, 63, 151),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,),
                ),
              daysOfWeekStyle: DaysOfWeekStyle(
                 weekdayStyle: TextStyle(color: Color(0xFF989DB3)),
                weekendStyle: TextStyle(color: Color(0xFF989DB3)),
                 dowTextFormatter: (date, locale) {
                    return date.weekday == DateTime.sunday ? 'S' : date.weekday == DateTime.monday ? 'M' :
                           date.weekday == DateTime.tuesday ? 'T' : date.weekday == DateTime.wednesday ? 'W' :
                           date.weekday == DateTime.thursday ? 'T' : date.weekday == DateTime.friday ? 'F' : 'S';
                  },
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  bool isAbsent = absentDates.any((d) => isSameDay(d, date));
                  bool isLeave = leaveDates.any((d) => isSameDay(d, date));
                  return Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isAbsent
                            ? Color(0xFFFFE9D4)
                            : isLeave
                                ? Color(0xFFD4F5FF)
                                : Color(0xFFD4FFEA),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextWidget(
                      '${date.day}',
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusCard(
                    'Present', Color(0xFFD4FFEA), presentDays.toString(),Color(0xFF12B264)),
                _buildStatusCard(
                    'Absent', Color(0xFFFFE9D4), absentDates.length.toString(),Color(0xFFFD3667)),
                _buildStatusCard(
                    'Leave', Color(0xFFD4F5FF), leaveDates.length.toString(),Color(0xFF473F97)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusCard(String label, Color color, String count , Color textColor,) {
    return Container(width: 105,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TextWidget(count,color: textColor,
              fontSize: 18, fontWeight: FontWeight.bold),
          SizedBox(height: 4),
          TextWidget(label, color: textColor,fontSize: 15,
          
            fontWeight: FontWeight.w400,),
        ],
      ),
    );
  }
}
