import 'package:flutter/material.dart';
import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/holiday_calendar/model/holiday_event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HolidayCalendarProvider extends ChangeNotifier {
  List<HolidayEventModel> _events = [];
  List<HolidayEventModel> _filteredEvents = [];
  bool _isLoading = true;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;
  EventType? _selectedEventType;

  // Getters
  List<HolidayEventModel> get events => _events;
  List<HolidayEventModel> get filteredEvents => _filteredEvents;
  bool get isLoading => _isLoading;
  DateTime get selectedDate => _selectedDate;
  DateTime get focusedDate => _focusedDate;
  int get selectedMonth => _selectedMonth;
  int get selectedYear => _selectedYear;
  EventType? get selectedEventType => _selectedEventType;

  // Sample data for events and holidays
  final List<Map<String, dynamic>> _sampleEvents = [
    {
      "id": "1",
      "title": "Independence Day",
      "description": "National holiday celebrating independence. The school will remain closed. Various cultural activities will take place virtually.",
      "date": "2025-08-15",
      "imageUrl": "assets/images/events/independence_day.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "2",
      "title": "Annual Sports Day",
      "description": "Annual sports event for all students. Various competitions will be held including races, long jump, high jump, and team sports like football and basketball.",
      "date": "2025-02-20",
      "imageUrl": "assets/images/events/sports_day.jpg",
      "isHoliday": false,
      "type": EventType.sports.index
    },
    {
      "id": "3",
      "title": "Parent-Teacher Meeting",
      "description": "Quarterly parent-teacher meeting to discuss academic progress of students. Parents are requested to attend without fail.",
      "date": "2025-03-10",
      "imageUrl": null,
      "isHoliday": false,
      "type": EventType.academic.index
    },
    {
      "id": "4",
      "title": "Science Exhibition",
      "description": "Annual science exhibition showcasing student projects. Open to all students and parents. Special prizes for the best projects.",
      "date": "2025-04-05",
      "imageUrl": "assets/images/events/science_exhibition.jpg",
      "isHoliday": false,
      "type": EventType.academic.index
    },
    {
      "id": "5",
      "title": "Diwali Break",
      "description": "School will remain closed for Diwali festival. Classes will resume after the break as per schedule.",
      "date": "2025-11-05",
      "imageUrl": "assets/images/events/diwali.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "6",
      "title": "Christmas Break",
      "description": "School will remain closed for Christmas and New Year. Classes will resume in January.",
      "date": "2025-12-25",
      "imageUrl": "assets/images/events/christmas.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "7",
      "title": "Cultural Fest",
      "description": "Annual cultural festival featuring music, dance, and drama performances by students. Parents are cordially invited to attend.",
      "date": "2025-01-15",
      "imageUrl": "assets/images/events/cultural_fest.jpg",
      "isHoliday": false,
      "type": EventType.cultural.index
    },
    {
      "id": "8",
      "title": "Republic Day",
      "description": "National holiday celebrating the adoption of the Constitution. Flag hoisting ceremony will be held at 8 AM.",
      "date": "2025-01-26",
      "imageUrl": "assets/images/events/republic_day.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "9",
      "title": "Final Examination",
      "description": "Annual final examination for all classes. Detailed schedule will be provided separately.",
      "date": "2025-03-15",
      "imageUrl": null,
      "isHoliday": false,
      "type": EventType.academic.index
    },
    {
      "id": "10",
      "title": "Summer Vacation",
      "description": "School will remain closed for summer vacation. Classes will resume as per the new academic calendar.",
      "date": "2025-05-10",
      "imageUrl": "assets/images/events/summer_vacation.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "11",
      "title": "Gandhi Jayanti",
      "description": "National holiday celebrating the birth anniversary of Mahatma Gandhi. Special assembly will be conducted virtually.",
      "date": "2025-10-02",
      "imageUrl": "assets/images/events/gandhi_jayanti.jpg",
      "isHoliday": true,
      "type": EventType.holiday.index
    },
    {
      "id": "12",
      "title": "Annual Day Celebration",
      "description": "Annual day celebration featuring performances by students. Parents are cordially invited to attend the event.",
      "date": "2025-12-15",
      "imageUrl": "assets/images/events/annual_day.jpg",
      "isHoliday": false,
      "type": EventType.cultural.index
    }
  ];

  void fetchEvents() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Load sample events
    _events = _sampleEvents.map((data) => HolidayEventModel.fromJson(data)).toList();
    
    // Initial filtering based on current month and year
    _filterEvents();

    _isLoading = false;
    notifyListeners();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDate = selectedDay;
    _focusedDate = focusedDay;
    _filterEvents();
    notifyListeners();
  }

  void onPageChanged(DateTime focusedDay) {
    _focusedDate = focusedDay;
    _selectedMonth = focusedDay.month;
    _selectedYear = focusedDay.year;
    _filterEvents();
    notifyListeners();
  }

  void setEventTypeFilter(EventType? type) {
    _selectedEventType = type;
    _filterEvents();
    notifyListeners();
  }

  void toggleEventExpanded(String id) {
    final index = _events.indexWhere((event) => event.id == id);
    if (index != -1) {
      _events[index] = _events[index].copyWith(isExpanded: !_events[index].isExpanded);
      
      // Also update in filtered events
      final filteredIndex = _filteredEvents.indexWhere((event) => event.id == id);
      if (filteredIndex != -1) {
        _filteredEvents[filteredIndex] = _filteredEvents[filteredIndex].copyWith(
          isExpanded: !_filteredEvents[filteredIndex].isExpanded
        );
      }
      
      notifyListeners();
    }
  }

  void _filterEvents() {
    // Filter by selected date
    _filteredEvents = _events.where((event) => 
      isSameDay(event.date, _selectedDate)
    ).toList();
    
    // Apply event type filter if selected
    if (_selectedEventType != null) {
      _filteredEvents = _filteredEvents.where((event) => 
        event.type == _selectedEventType
      ).toList();
    }
    
    // Sort by date
    _filteredEvents.sort((a, b) => a.date.compareTo(b.date));
  }

  List<HolidayEventModel> getEventsForDay(DateTime day) {
    return _events.where((event) => isSameDay(event.date, day)).toList();
  }

  Map<DateTime, List<HolidayEventModel>> get eventsByDay {
    final Map<DateTime, List<HolidayEventModel>> result = {};
    
    for (final event in _events) {
      final date = DateTime(event.date.year, event.date.month, event.date.day);
      if (result[date] == null) {
        result[date] = [];
      }
      result[date]!.add(event);
    }
    
    return result;
  }

  List<HolidayEventModel> getEventsForMonth(int month, int year) {
    return _events.where((event) => 
      event.date.month == month && event.date.year == year
    ).toList();
  }

  // Get holidays for current month
  List<HolidayEventModel> get currentMonthHolidays {
    return _events.where((event) => 
      event.date.month == _selectedMonth && 
      event.date.year == _selectedYear && 
      event.isHoliday
    ).toList();
  }

  // Get events for current month (excluding holidays)
  List<HolidayEventModel> get currentMonthEvents {
    return _events.where((event) => 
      event.date.month == _selectedMonth && 
      event.date.year == _selectedYear && 
      !event.isHoliday
    ).toList();
  }
} 