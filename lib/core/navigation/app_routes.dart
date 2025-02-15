// ignore_for_file: unused_element



import 'package:school_management/features/login/view/login_view.dart';

import '../library/library.dart';

class AppRoutes {
  static const String login = '/login';
  static const String hardwareOverview = '/hardwareOverview';
  static const String addItems = '/addItems';
  static const String leaderboard = '/leaderboard';
  static const String recommendation = '/recommendation';
  static const String leaderboardList = '/leaderboardList';
  static const String notificationList = "/notificationList";
  static const String webView = "/webView";
  static const String selectLanguage = "/selectLanguage";
  static const String concern = "/concern";
  static const String delegateSurvey = "/delegateSurvey";
  static const String profile = "/profile";

  static Duration transitionDuration =  Duration(milliseconds: 500);

  static final transaction = _slideTransition;
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: "/login",
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: transitionDuration,
          child: LoginScreen(),
          transitionsBuilder: transaction,
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
