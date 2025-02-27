// ignore_for_file: unused_element
import 'package:school_management/core/library/library.dart' ;
import 'package:school_management/features/attendance/view/attendance_view.dart';
import 'package:school_management/features/homework/view/homework_view.dart';
import 'package:school_management/features/profile/view/profile_view.dart';

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
