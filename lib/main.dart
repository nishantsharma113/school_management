import 'package:flutter/material.dart';
import 'package:school_management/core/navigation/app_routes.dart';
import 'package:school_management/core/constants/app_constant.dart';
import 'package:school_management/core/theme/app_theme.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: AppRoutes.router,
      );
  }
}



