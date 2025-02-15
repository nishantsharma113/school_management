import 'package:flutter/material.dart';
import 'package:school_management/Utility/app_routes.dart';
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
       
        title: 'Edu Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            
            drawerTheme: DrawerThemeData(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(),
              
            ),
            switchTheme: SwitchThemeData(
              thumbColor: WidgetStateProperty.all(Colors.white),
              trackColor: WidgetStateProperty.all(Colors.green),
              
            ),

            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                surfaceTintColor: Colors.white, backgroundColor: Colors.white)),
        routerConfig: AppRoutes.router,
      );
  }
}



