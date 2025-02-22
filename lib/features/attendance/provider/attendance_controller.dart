import 'package:school_management/core/library/library.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<DateTime> _leaveDates = [
    DateTime(2024, 4, 5), DateTime(2024, 4, 12),
    DateTime(2024, 4, 19), DateTime(2024, 4, 26)
  ];

  final List<DateTime> _absentDates = [
    DateTime(2024, 4, 10), DateTime(2024, 4, 15),
    DateTime(2024, 4, 16)
  ];

  List<DateTime> get leaveDates => _leaveDates;
  List<DateTime> get absentDates => _absentDates;
}
