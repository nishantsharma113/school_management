import 'package:school_management/core/library/library.dart';

ThemeData themeData = ThemeData(
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
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white));
