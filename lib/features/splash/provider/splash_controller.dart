import 'package:school_management/core/library/library.dart';

class SplashController extends ChangeNotifier {
  navigateScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if (!context.mounted) return;
    context.go(AppRoutes.login);
  }
}
