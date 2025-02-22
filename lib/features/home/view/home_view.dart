import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/home/provider/home_controller.dart';

import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/custom_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(loginBgImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              30.heightBox,
              logo.toImage(width: 120, height: 120, fit: BoxFit.contain),
              60.heightBox,
              tile(
                  context: context,
                  title: "PTM",
                  icon: parentIcon,
                  onPressed: () {
                    context.go(AppRoutes.home);
                    _advancedDrawerController.hideDrawer();
                  }),
              tile(
                  context: context,
                  title: "Circuler",
                  icon: circulerIcon,
                  onPressed: () {
                    context.go(AppRoutes.profile);
                    _advancedDrawerController.hideDrawer();
                  }),
              tile(
                  context: context,
                  title: "Holiday & Event Calendar",
                  icon: calenderIcon2,
                  onPressed: () {
                    _advancedDrawerController.hideDrawer();
                  }),
              tile(
                  context: context,
                  title: "Logout",
                  icon: logoutIcon,
                  onPressed: () {
                    context.go(AppRoutes.login);
                    _advancedDrawerController.hideDrawer();
                  }),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Home",
          onNotificationTap: () {
            context.go(AppRoutes.notification);
          },
          onDrawerTap: _handleDrawerButton,
        ),
        body: ColoredBox(
          color: Color(0xFF473F97),
          child: Container(
              width: context.screenWidth,
              height: context.screenHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<HomeProvider>().changePage(0);
                        },
                        child: ColoredBox(
                          color: Colors.white,
                          child: Column(
                            children: [
                              TextWidget(
                                "Student",
                                color:
                                    context.watch<HomeProvider>().pageIndex == 0
                                        ? secondaryColor
                                        : primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              5.heightBox,
                              Container(
                                  width: context.screenWidth / 3.5,
                                  height: 2.0,
                                  color:
                                      context.watch<HomeProvider>().pageIndex ==
                                              0
                                          ? secondaryColor
                                          : Colors.white)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeProvider>().changePage(1);
                        },
                        child: ColoredBox(
                          color: Colors.white,
                          child: Column(
                            children: [
                              TextWidget(
                                "School",
                                color:
                                    context.watch<HomeProvider>().pageIndex == 1
                                        ? secondaryColor
                                        : primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              5.heightBox,
                              Container(
                                  width: context.screenWidth / 3.5,
                                  height: 2.0,
                                  color:
                                      context.watch<HomeProvider>().pageIndex ==
                                              1
                                          ? secondaryColor
                                          : Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).p16(),
                  Expanded(
                    child: PageView(
                      controller: context.read<HomeProvider>().pageController,
                      onPageChanged: context.read<HomeProvider>().changePage,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          spacing: 16,
                          runSpacing: 10,
                          children: [
                            Tile(
                                icon: homeWork,
                                label: "Home Work",
                                onPressed: () {
                                  context.go(AppRoutes.homework);
                                }),
                            Tile(
                                icon: attendance,
                                label: "Attendance",
                                onPressed: () {
                                  context.go(AppRoutes.attendance);
                                }),
                            Tile(
                                icon: subjectTeacher,
                                label: "Subject Teacher",
                                onPressed: () {}),
                            Tile(
                                icon: timeTable,
                                label: "Class Time Table",
                                onPressed: () {}),
                            Tile(
                                icon: examSchedule,
                                label: "Exam Schedule",
                                onPressed: () {}),
                            Tile(
                                icon: resultIcon,
                                label: "Exam Result",
                                onPressed: () {}),
                            Tile(
                                icon: syllabus,
                                label: "Syllabus",
                                onPressed: () {}),
                            Tile(
                                icon: remark,
                                label: "Remarks",
                                onPressed: () {}),
                            Tile(
                                icon: feeDeatils,
                                label: "Fees Detail",
                                onPressed: () {}),
                          ],
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 16,
                          runSpacing: 10,
                          children: [
                            Tile(
                                icon: galleryIcon,
                                label: "Gallery",
                                onPressed: () {
                                  context.go(AppRoutes.homework);
                                }),
                            Tile(
                                icon: locationIcon,
                                label: "Map",
                                onPressed: () {
                                  context.go(AppRoutes.attendance);
                                }),
                            Tile(
                                icon: circulerIcon,
                                label: "School Timing",
                                onPressed: () {}),
                            Tile(
                                icon: syllabus,
                                label: "School Desk",
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ).p16(),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  ListTile tile(
      {required BuildContext context,
      required String title,
      required String icon,
      Function()? onPressed}) {
    return ListTile(
      onTap: onPressed,
      leading: icon.toImage(color: Colors.white).wh(25, 25),
      title: TextWidget(
        title,
        color: Colors.white,
        fontSize: 18,
      ),
    );
    // return ListTile(
    //           onTap: () {
    //             context.go(AppRoutes.home);
    //             _advancedDrawerController.hideDrawer();
    //           },
    //           leading: parentIcon.toImage(color: Colors.white).wh(30, 30),
    //           title: const TextWidget(
    //             'PTM',
    //             color: Colors.white,
    //             fontSize: 18,
    //           ),
    //         );
  }

  void _handleDrawerButton() {
    _advancedDrawerController.showDrawer();
  }
}
