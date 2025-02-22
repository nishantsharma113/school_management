import 'package:school_management/core/library/library.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;

  final PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  void changePage(int index) {
    pageController.jumpToPage(index);
    pageIndex = index;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
