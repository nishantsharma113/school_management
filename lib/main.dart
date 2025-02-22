import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/attendance/provider/attendance_controller.dart';
import 'package:school_management/features/home/provider/home_controller.dart';
import 'package:school_management/features/homework/provider/homework_controller.dart';
import 'package:school_management/features/profile/provider/profile_controller.dart';

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
        ],
        child: MaterialApp.router(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routerConfig: AppRoutes.router,
        ));
  }
}
