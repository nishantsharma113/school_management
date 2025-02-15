
import 'package:intl/intl.dart';
import 'package:school_management/core/library/library.dart';

class DateTimeUtils {
  /// Get difference between two dates in various formats
  static String getDateDifference(String dateString) {
    try {
      // Parse the input date string
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      DateTime now = DateTime.now();
      Duration difference = now.difference(date);

      // Convert to absolute values
      int days = difference.inDays.abs();
      int months = (days / 30).floor();
      int years = (days / 365).floor();
      int hours = difference.inHours.abs();
      int minutes = difference.inMinutes.abs();

      // Return appropriate string based on the difference
      if (years > 0) {
        return years == 1 ? '1 year' : '$years years';
      } else if (months > 0) {
        return months == 1 ? '1 month' : '$months months';
      } else if (days > 0) {
        return days == 1 ? '1 day' : '$days days';
      } else if (hours > 0) {
        return hours == 1 ? '1 hour' : '$hours hours';
      } else if (minutes > 0) {
        return minutes == 1 ? '1 minute' : '$minutes minutes';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return dateString;
    }
  }

  /// Format date to specific format
  static String formatDate(String dateString, {String format = 'dd MMM yyyy'}) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      return DateFormat(format).format(date);
    } catch (e) {
      return dateString;
    }
  }

  /// Check if date is today
  static bool isToday(String dateString) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      DateTime now = DateTime.now();
      return date.year == now.year && 
             date.month == now.month && 
             date.day == now.day;
    } catch (e) {
      return false;
    }
  }

  /// Get remaining time until a date
  static String getRemainingTime(String dateString) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      DateTime now = DateTime.now();
      Duration difference = date.difference(now);

      if (difference.isNegative) {
        return 'Expired';
      }

      int days = difference.inDays;
      int hours = difference.inHours % 24;
      int minutes = difference.inMinutes % 60;

      if (days > 0) {
        return '$days days remaining';
      } else if (hours > 0) {
        return '$hours hours remaining';
      } else {
        return '$minutes minutes remaining';
      }
    } catch (e) {
      return 'Invalid date';
    }
  }

  /// Get formatted time
  static String getTime(String dateString) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      return DateFormat('hh:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }

  /// Check if date is within last X days
  static bool isWithinDays(String dateString, int days) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      DateTime now = DateTime.now();
      Duration difference = now.difference(date);
      return difference.inDays <= days;
    } catch (e) {
      return false;
    }
  }

  /// Get custom date format
  static String getCustomFormat(String dateString, String format) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
      return DateFormat(format).format(date);
    } catch (e) {
      return dateString;
    }
  }
 

  /// Parse string to DateTime
  static DateTime? parseDate(String date, {String format = 'dd/MM/yyyy'}) {
    try {
      return DateFormat(format).parse(date);
    } catch (e) {
      return null;
    }
  }

  /// Check if date is before another date
  static bool isBefore(DateTime date, DateTime other) {
    return date.isBefore(other);
  }

  /// Check if date is after another date
  static bool isAfter(DateTime date, DateTime other) {
    return date.isAfter(other);
  }

  /// Check if date is between two dates
  static bool isBetween(DateTime date, DateTime start, DateTime end) {
    return date.isAfter(start) && date.isBefore(end);
  }

  /// Get age from date
  static int getAge(DateTime birthDate) {
    final DateTime now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || 
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Get difference between two dates in days
  static int getDaysDifference(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }

  /// Get difference between two dates in months
  static int getMonthsDifference(DateTime start, DateTime end) {
    return (end.year - start.year) * 12 + end.month - start.month;
  }

  /// Get difference between two dates in years
  static int getYearsDifference(DateTime start, DateTime end) {
    return end.year - start.year;
  }

  /// Check if date is today


  

  /// Get list of dates between two dates
  static List<DateTime> getDatesBetween(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= getDaysDifference(start, end); i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }



static String customFormatDate(String inputDate) {
  // Parse the input date (dd-MM-yyyy)
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  DateTime parsedDate = inputFormat.parse(inputDate);

  // Get today's date
  DateTime today = DateTime.now();

  // Calculate yesterday's date
  DateTime yesterday = today.subtract(Duration(days: 1));

  // Compare the dates
  if (DateUtils.isSameDay(parsedDate, today)) {
    return "Today";
  } else if (DateUtils.isSameDay(parsedDate, yesterday)) {
    return "Yesterday";
  } else {
    // Format the date back to a readable string
    DateFormat outputFormat = DateFormat('dd-MM-yyyy');
    return outputFormat.format(parsedDate);
  }
}

}