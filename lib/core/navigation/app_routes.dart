// ignore_for_file: unused_element
import 'package:school_management/core/library/library.dart' ;
import 'package:school_management/features/attendance/view/attendance_view.dart';
import 'package:school_management/features/exam_result/view/exam_result_view.dart';
import 'package:school_management/features/exam_schedule/view/exam_schedule_view.dart';
import 'package:school_management/features/fees_details/view/fees_details_view.dart';
import 'package:school_management/features/homework/view/homework_view.dart';
import 'package:school_management/features/profile/view/profile_view.dart';
import 'package:school_management/features/subject_teacher/view/teacher_view.dart';
import 'package:school_management/features/syllabus/view/syllabus_view.dart';
import 'package:school_management/features/timetable/view/timetable_view.dart';
import 'package:school_management/features/remark/view/remark_view.dart';
import 'package:school_management/features/student_profile/view/student_profile_view.dart';
import 'package:school_management/features/gallery/view/gallery_view.dart';
import 'package:school_management/features/school_timing/view/school_timing_view.dart';
import 'package:school_management/features/school_desk/view/school_desk_view.dart';
import 'package:school_management/features/school_map/view/school_map_view.dart';
import 'package:school_management/features/ptm/view/ptm_view.dart';
import 'package:school_management/features/circular/view/circular_view.dart';
import 'package:school_management/features/holiday_calendar/view/holiday_calendar_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String homework = '/homework';
  static const String attendance = '/attendance';
  static const String leaderboardList = '/leaderboardList';
  static const String notificationList = "/notificationList";
  static const String webView = "/webView";
  static const String selectLanguage = "/selectLanguage";
  static const String concern = "/concern";
  static const String delegateSurvey = "/delegateSurvey";
  static const String profile = "/profile";
  static const String feesDetails = "/feesDetails";
  static const String timetable = "/timetable";
  static const String examResult = "/examResult";
  static const String syllabus = "/syllabus";
  static const String examSchedule = "/examSchedule";
  static const String remark = "/remark";
  static const String teacher = "/teacher";
  static const String studentProfile = "/studentProfile";
  static const String gallery = "/gallery";
  static const String schoolTiming = "/schoolTiming";
  static const String schoolDesk = "/schoolDesk";
  static const String schoolMap = "/schoolMap";
  static const String ptm = "/ptm";
  static const String circular = '/circular';
  static const String holidayCalendar = "/holiday-calendar";

  static Duration transitionDuration = Duration(milliseconds: 500);

  static final transaction = _slideTransition;
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
       GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: transitionDuration,
          child: SplashScreen(),
          transitionsBuilder: transaction,
        ),
      ),
      GoRoute(
        path: login,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: transitionDuration,
          child: LoginScreen(),
          transitionsBuilder: transaction,
        ),
      ),
      GoRoute(
          path: home,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: HomeScreen(),
                transitionsBuilder: transaction,
              )),
               GoRoute(
          path: notification,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: NotificationScreen(),
                transitionsBuilder: transaction,
              )),
               GoRoute(
          path: homework,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: HomeWorkScreen(),
                transitionsBuilder: transaction,
              )),
                  GoRoute(
          path: attendance,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: AttendanceScreen(),
                transitionsBuilder: transaction,
              )),
                GoRoute(
          path: profile,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: ProfileScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: feesDetails,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: FeesDetailsScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: timetable,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: TimetableScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: examResult,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: ExamResultScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: syllabus,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: SyllabusScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: examSchedule,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: ExamScheduleScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: remark,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: RemarkScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: teacher,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: TeacherScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: studentProfile,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: StudentProfileScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
          path: gallery,
          pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: transitionDuration,
                child: GalleryScreen(),
                transitionsBuilder: transaction,
              )),
      GoRoute(
        path: schoolTiming,
        builder: (context, state) => const SchoolTimingScreen(),
      ),
      GoRoute(
        path: schoolDesk,
        builder: (context, state) => const SchoolDeskScreen(),
      ),
      GoRoute(
        path: schoolMap,
        builder: (context, state) => const SchoolMapScreen(),
      ),
      GoRoute(
        path: ptm,
        builder: (context, state) => const PTMScreen(),
      ),
      GoRoute(
        path: circular,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CircularScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: holidayCalendar,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HolidayCalendarScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],
  );

  static Widget _slideTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }

// ✅ Fade Transition
  static Widget _fadeTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

// ✅ Scale Transition
  static Widget _scaleTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
