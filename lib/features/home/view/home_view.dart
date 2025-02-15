import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/common/bottom_bar.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Home",
          onNotificationTap: () {
            context.go(AppRoutes.notification);
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {},
        ),
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            children: [
              CarouselView(
                  backgroundColor: Colors.grey[200],
                  itemExtent: context.screenWidth,
                  children: [
                    banner1
                        .toImage(
                          width: context.screenWidth,
                        )
                        .pOnly(top: 20.0),
                    banner2
                        .toImage(
                          width: context.screenWidth,
                        )
                        .pOnly(top: 20.0),
                  ]).wh(context.screenWidth, 200),
            ],
          ),
        ));
  }
}
