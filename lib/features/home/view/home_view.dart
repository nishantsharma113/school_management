import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/common/bottom_bar.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/custom_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Home",
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {},
        ),
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: ListView(
            children: [
              CarouselView(
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemExtent: context.screenWidth,
                  children: [
                    banner1.toImage(
                        width: context.screenWidth,
                        height: context.screenHeight * 0.3,
                        fit: BoxFit.cover),
                    banner2.toImage(
                        width: context.screenWidth,
                        height: context.screenHeight * 0.3,
                        fit: BoxFit.cover),
                  ]).wh(context.screenWidth, 200),
              20.heightBox,
              Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 16,
                runSpacing: 10,
                children: [
                  Tile(
                      icon: homeWork,
                      label: "Home Work",
                      backgroundColor: Color(0xff5e9fe3)),
                  Tile(
                      icon: attendance,
                      label: "Attendance",
                      backgroundColor: Color(0xffe66b6e)),
                  Tile(
                      icon: subjectTeacher,
                      label: "Subject Teacher",
                      backgroundColor: Color(0xffe6ae75)),
                  Tile(
                      icon: timeTable,
                      label: "Class Time Table",
                      backgroundColor: Color(0xffa28be3)),
                  Tile(
                      icon: examSchedule,
                      label: "Exam Schedule",
                      backgroundColor: Color(0xff2078dc)),
                  Tile(
                      icon: resultIcon,
                      label: "Exam Result",
                      backgroundColor: Color(0xffdf78a7)),
                  Tile(
                      icon: syllabus,
                      label: "Syllabus",
                      backgroundColor: Color(0xffe6ae75)),
                  Tile(
                      icon: remark,
                      label: "Remarks",
                      backgroundColor: Color(0xff5e9fe3)),
                  Tile(
                      icon: payment,
                      label: "Fees Detail",
                      backgroundColor: Color(0xff2078dc)),
                ],
              ),
            ],
          ).p16(),
        ));
  }
}
