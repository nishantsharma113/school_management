import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/attendance/provider/attendance_controller.dart';
import 'package:school_management/features/exam_result/provider/exam_result_provider.dart';
import 'package:school_management/features/exam_schedule/provider/exam_schedule_provider.dart';
import 'package:school_management/features/fees_details/provider/fees_provider.dart';
import 'package:school_management/features/home/provider/home_controller.dart';
import 'package:school_management/features/homework/provider/homework_controller.dart';
import 'package:school_management/features/profile/provider/profile_controller.dart';
import 'package:school_management/features/syllabus/provider/syllabus_provider.dart';
import 'package:school_management/features/timetable/provider/timetable_provider.dart';
import 'package:school_management/features/remark/provider/remark_provider.dart';
import 'package:school_management/features/subject_teacher/provider/teacher_provider.dart';
import 'package:school_management/features/student_profile/provider/student_provider.dart';
import 'package:school_management/features/gallery/provider/gallery_provider.dart';
import 'package:school_management/features/school_timing/provider/school_timing_provider.dart';
import 'package:school_management/features/school_desk/provider/school_desk_provider.dart';
import 'package:school_management/features/school_map/provider/school_map_provider.dart';
import 'package:school_management/features/ptm/provider/ptm_provider.dart';
import 'package:school_management/features/circular/provider/circular_provider.dart';
import 'package:school_management/features/holiday_calendar/provider/holiday_calendar_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SplashController>(
              create: (_) => SplashController()),
                ChangeNotifierProvider<HomeProvider>(
              create: (_) => HomeProvider()),
               ChangeNotifierProvider<HomeworkProvider>(
              create: (_) => HomeworkProvider()),
               ChangeNotifierProvider<AttendanceProvider>(
              create: (_) => AttendanceProvider()),
               ChangeNotifierProvider<ProfileProvider>(
              create: (_) => ProfileProvider()),
               ChangeNotifierProvider<FeesProvider>(
              create: (_) => FeesProvider()),
               ChangeNotifierProvider<TimetableProvider>(
              create: (_) => TimetableProvider()),
               ChangeNotifierProvider<ExamResultProvider>(
              create: (_) => ExamResultProvider()),
               ChangeNotifierProvider<SyllabusProvider>(
              create: (_) => SyllabusProvider()),
               ChangeNotifierProvider<ExamScheduleProvider>(
              create: (_) => ExamScheduleProvider()),
               ChangeNotifierProvider<RemarkProvider>(
              create: (_) => RemarkProvider()),
               ChangeNotifierProvider<TeacherProvider>(
              create: (_) => TeacherProvider()),
               ChangeNotifierProvider<StudentProvider>(
              create: (_) => StudentProvider()),
               ChangeNotifierProvider<GalleryProvider>(
              create: (_) => GalleryProvider()),
               ChangeNotifierProvider<SchoolTimingProvider>(
              create: (_) => SchoolTimingProvider()),
               ChangeNotifierProvider<SchoolDeskProvider>(
              create: (_) => SchoolDeskProvider()),
               ChangeNotifierProvider<SchoolMapProvider>(
              create: (_) => SchoolMapProvider()),
               ChangeNotifierProvider<PTMProvider>(
              create: (_) => PTMProvider()),
               ChangeNotifierProvider<CircularProvider>(
              create: (_) => CircularProvider()),
               ChangeNotifierProvider<HolidayCalendarProvider>(
              create: (_) => HolidayCalendarProvider()),
        ],
        child: MaterialApp.router(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routerConfig: AppRoutes.router,
        ));
  }
}
